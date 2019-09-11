class Trainee::TraineeAnswerSheetsController < ApplicationController
  before_action :authenticate_loggedin_user
  before_action :authenticate_trainee_user
  before_action :load_exam, only: :new

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

  private
  def load_exam
    @exam = Exam.find_by id: params[:exam_id]
    unless @exam
      flash[:danger] = t "cant_join"
      redirect_to trainee_exams_path 
    end
  end

  def answer_sheet_params
    default = { finish_time: Time.zone.now, total_mark: 0, is_passed: false }
    params.require(:trainee_answer_sheet).permit(:start_time, :exam_id, :answer_sheet).reverse_merge(default)
  end
end
