class QuestionsController < ApplicationController
  before_action :load_question, only: :destroy
  
  def new; end

  def create
    @question = Question.new question_params
    @question.save ? flash[:success] = t("qs_create") : flash[:danger] = t("failed_qs_create")
    redirect_to edit_subject_path(tab: "question", id: current_subject.id)
  end

  def update
    @question.update_attributes(question_params) ? flash[:success] = t("qs_updated") : flash.now[:danger] = t("failed_qs_update")
    redirect_to edit_subject_path(tab: "question", id: current_subject.id)
  end

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

  def question_params
    answers_arr = params[:answers]
    key_arr = ("a".."z").to_a
    answers = Hash[answers_arr.map.with_index{ |key, index| [key_arr[index], answers_arr[index]] }]

    defaults = {answers: answers.to_json, type_of_question: params[:type_of_question].to_i,
                create_by: current_user.id, subject_id: current_subject.id, 
                correct_answers: params[:correct_answers].to_json }
    params.require(:question).permit(:question_content).reverse_merge(defaults)
  end
end
