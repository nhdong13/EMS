class ExamHasQuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :load_data, only: :destroy

  def create
    @exam_questions = ExamHasQuestion.new(exam_id: params[:exam_id], 
      question_id: params[:question_id], mark: params[:mark])
    send_render_data @exam_questions.save
  end

  def destroy
    send_render_data @exam_qs.destroy
  end

  private 
  def send_render_data flag
    respond_to do |format|
      if flag
        flash.now[:success] = t "added_eq"
        @exam = Exam.find_by(id: params[:exam_id])
        @questions = current_subject.questions
        format.html { render "/exams/_question_table",layout: false }
      else
        flash.now[:danger] = t "failed_add"
        format.html {render inline: 
          "<div class='alert alert-danger'>"+ t("user_not_found") +"</div>"}
      end
    end
  end

  def load_data
    @exam_qs = ExamHasQuestion.where(exam_id: params[:exam_id], question_id: params[:question_id]).first
  end
end
