helpers do
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authorize_entry
    current_user.id == @user.id
  end
  
  def logged_in?
    session[:user_id] != nil
  end

  def authenticate!
    redirect '/sessions/new' unless logged_in?
  end
end
