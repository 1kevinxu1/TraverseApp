class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :require_user

  private

  def current_user
    @current_user ||= User.find_by_session_digest(session[:token])
  end

  def sign_in!(user)
    @current_user = user
    session[:token] = user.session_digest
  end

  def logged_in?
    redirect_to root_url if current_user
  end

  def sign_out!
    current_user.reset_session_digest
    session[:token] = nil
  end

  def require_user
    redirect_to new_session_url unless current_user
  end
end
