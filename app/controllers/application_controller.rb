class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionHelper

  def authenticate_loggedin_user
    redirect_to login_path unless logged_in?
  end

  def authenticate_trainee_user
    redirect_to root_path unless current_user.trainee?
  end
end
