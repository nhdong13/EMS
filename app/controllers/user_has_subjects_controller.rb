class UserHasSubjectsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :load_user, only: %i(create destroy)
  
  def create
    user_subject = UserHasSubject.new(subject_id: current_subject.id, user_id: @user.id)
    send_render_data user_subject.save
  end

  def destroy
    send_render_data current_subject.kick_user(@user)
  end

  private
  def load_user
    @user = User.find_by(id: params[:user_id])
    unless @user
      flash[:danger] = t "user_not_found"
      redirect_to edit_subject_path(tab: "trainee", id: current_subject)
    end
  end

  def send_render_data flag
    respond_to do |format|
      if flag
        @available_trainees = User.trainees_not_in_subject(current_subject)
          .trainee.ordered_user_by_name
        @joined_trainees = current_subject.users.ordered_user_by_name
        format.html { render "/subjects/_tab_trainees",layout: false, 
          available_trainees: @available_trainees, joined_trainees: @joined_trainees }
      else
        format.html {render inline: 
          "<div class='alert alert-danger'>"+ t("user_not_found") +"</div>"}
      end
    end
  end
end
