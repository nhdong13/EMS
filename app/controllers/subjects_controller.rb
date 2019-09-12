class SubjectsController < ApplicationController
  before_action :load_subject, only: %i(edit update)
  
  def index
    @subjects = current_user.created_subjects.ordered_subjects_by_name
      .page(params[:page]).per(Settings.subject.paging.per)
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t "subject_created"
    else
      flash[:danger] = t "subject_create_fail"
    end
    redirect_to subjects_path
  end

  def edit
    @questions = @subject.questions
    @exams = @subject.exams
  end

  def update
    if @subject.update_attributes(subject_params)
      flash[:success] = t "subject_updated"
      redirect_to subjects_path
    else
      flash.now[:danger] = t "failed"
      render :edit
    end
  end

  private
  def subject_params
    defaults = {create_by: current_user.id, status: true}
    params.require(:subject).permit(:name, :description).reverse_merge(defaults)
  end  

  def load_subject
    @subject = Subject.find_by(id: params[:id])
    unless @subject
      flash[:danger] = t "subject_failed_load"
      redirect_to subjects_path 
    end
  end
end
