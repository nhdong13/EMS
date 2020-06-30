class HomeController < ApplicationController
  before_action :authenticate_loggedin_user

  def index
    redirect_to home_path
  end

  private

  def home_path
    case current_user.role
    when "trainee"
      trainee_trainee_answer_sheets_path
    when "supervisor"
      subjects_path
    when "admin"
      subjects_path
    end 
  end
end
