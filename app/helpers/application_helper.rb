module ApplicationHelper
  def user_signed_in?
    return true if session[:user_id] and session[:user_id] == current_user.id and current_user != {}
    false
  end

   def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
