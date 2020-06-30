class Trainee::ExamsController < ApplicationController
  def index
    @exams = current_user.can_join_exams
  end

  def show
    @exam = Exam.find_by(id: params[:id])
    
    respond_to do |format|
      if @exam
        format.html { render @exam }
      # format.json { render json: @exam }
      else
        format.html {render inline: "<div class='alert alert-danger'>"+ t("not_found") +"</div>"}
      end
    end
  end
end
