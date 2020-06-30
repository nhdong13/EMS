class SessionController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = t "invalid_login"
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to login_path
  end
end
