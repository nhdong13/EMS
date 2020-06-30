class Trainee::TraineeAnswerSheetsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_loggedin_user
  before_action :load_exam, only: :new
  before_action :load_answersheet, only: %i(show update)

  def index
    @answer_sheets = current_user.trainee_answer_sheets
      .page(params[:page]).per(Settings.trainee_answer_sheet.paging.per)
  end

  def new
    @questions = @exam.questions.to_a.shuffle
    @answer_sheet = current_user.trainee_answer_sheets.new
    @time_limit = @exam.time_limit
  end

  def create
    @answer_sheet = current_user.trainee_answer_sheets.new answer_sheet_params
    if @answer_sheet.save 
      flash[:success] = t "success_finish"
      redirect_to root_path
    else 
      flash.now[:danger] = t "unsuccess"
    end
  end

  def show
    @answer_sheet = JSON.parse(@answersheet.answer_sheet)
    @questions = []
    @answer_sheet.each do |item|
      @questions << Question.find_by(id: item["question_id"])
    end
  end

  def update
    mark = 0
    @questions = @answersheet.exam.questions
    answersheet = JSON.parse @answersheet.answer_sheet
    answersheet.each do |answer_sheet|
      question = @questions.where(id: answer_sheet["question_id"]).first
      answer = JSON.parse(question.correct_answers)
      trainee_answer = answer_sheet["trainee_answers"]
      mark += ExamHasQuestion.where(exam_id: @answersheet.exam.id, question_id: question.id) 
        .first.mark if answer == trainee_answer
    end
    @answersheet.total_mark = mark
    @answersheet.status = 1 
    @answersheet.is_passed = 1 if mark >= @answersheet.exam.mark_require
    
    respond_to do |format|
      if @answersheet.save
        flash.now[:success] = t "marking"
        @answersheets = @answersheet.exam.trainee_answer_sheets
        format.html { render "/exams/_answersheet_table", layout: false }
      else
        flash.now[:danger] = t "not_found"
        format.html {render inline: 
          "<div class='alert alert-danger'>"+ t("user_not_found") +"</div>"}
      end
    end
  end

  private
  def load_exam
    @exam = Exam.find_by id: params[:exam_id]
    unless @exam
      flash[:danger] = t "cant_join"
      redirect_to trainee_exams_path 
    end
  end

  def load_answersheet
    @answersheet = TraineeAnswerSheet.find_by(id: params[:id])
    unless @answersheet
      flash[:danger] = t "answersheet_failed"
      redirect_to trainee_trainee_answer_sheets_path
    end
  end

  def answer_sheet_params
    default = { finish_time: Time.zone.now, total_mark: 0, status: false }
    params.require(:trainee_answer_sheet).permit(:start_time, :exam_id, :answer_sheet).reverse_merge(default)
  end
end
