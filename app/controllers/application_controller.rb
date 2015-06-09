class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :require_user

  private

  def current_user
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def sign_in!(user)
    @current_user = user
    session[:token] = user.session_token
  end

  def sign_out!
    current_user.reset_session_token
    session[:token] = nil
    redirect_to root_url
  end

  def require_user
    redirect_to root_url unless current_user
  end
end
