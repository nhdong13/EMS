class UsersController < ApplicationController
  before_action :authenticate_loggedin_user
  before_action :load_user, only: %i(edit show update)
  before_action :authenticate_permission_user, only: %i(edit show update)

  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params_with_default
    if @user.save
      log_in @user
      flash[:success] = t "success"
      redirect_to edit_user_path(current_user)
    else
      flash[:danger] = t "failed"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = t "updated"
      redirect_to @user
    else
      flash.now[:danger] = t "failed"
      render :edit
    end
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "user_not_found"
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:fullname, :password, :password_confirmation, :email, :address, :phone)
  end

  def user_params_with_default
    defaults = {status: true, role: User.roles[:trainee], create_by: current_user.id}
    user_params.reverse_merge(defaults)
  end

  def authenticate_permission_user
    redirect_to root_path unless current_user.id.to_s == params[:id]
  end
end
