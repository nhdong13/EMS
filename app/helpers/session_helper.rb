module SessionHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def set_current_subject(subject)
    session[:subject_id] = subject.id
  end

  def current_subject
    if session[:subject_id]
      @current_subject ||= Subject.find_by(id: session[:subject_id])
    end
  end
end
