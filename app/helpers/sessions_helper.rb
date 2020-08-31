module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
