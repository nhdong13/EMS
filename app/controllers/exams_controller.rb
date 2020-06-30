class ExamsController < ApplicationController
  before_action :load_exam, only: %i(show edit update)
  def create
    @exam = Exam.new exam_params_with_default
    if @exam.save
      flash[:success] = t "save_success"
    else
      flash[:danger] = t "fail_save"
    end
    redirect_to edit_subject_path(tab: "exam", id: current_subject)
  end

  def edit
    @questions = current_subject.questions
    @answersheets = @exam.trainee_answer_sheets
  end

  def update
    if @exam.update_attributes(exam_params)
      flash[:success] = t "exam_update"
      else
      flash[:danger] = t "fail_save"
    end
    redirect_to edit_exam_path(@exam)
  end

  private
  def exam_params
    defaults = {status: params[:status].to_i}
    params.require(:exam).permit(:name, :mark_require, :time_limit).reverse_merge(defaults)
  end

  def exam_params_with_default
    defaults = {create_by: current_user.id, subject_id: current_subject.id, status: params[:status].to_i}
    exam_params.reverse_merge(defaults)
  end

  def load_exam
    @exam = Exam.find_by(id: params[:id])
    unless @exam
      flash[:danger] = t "fail_show"
      redirect_to edit_subject_path(tab: "exam", id: current_subject)
    end
  end
end
