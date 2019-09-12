class QuestionsController < ApplicationController
  before_action :load_question, only: :destroy
  
  def new; end

  def destroy
    if @question.destroy
      flash[:success] = t "qs_destroy"
    else
      flash[:danger] = t "failed_qs_destroy"
    end
    redirect_to edit_subject_path(tab: "question")
  end

  private
  def load_question
    @question = Question.find_by id: params[:question]
    unless @question
      flash[:danger] = t "qs_not_found"
      redirect_to edit_subject_path(tab: "question")
    end
  end
end
