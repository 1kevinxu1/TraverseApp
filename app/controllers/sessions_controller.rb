class SessionsController < ApplicationController
  before_action :logged_in?, only: [:create]

  def create
    @user = User.find_by_credentials(login_params)
    if @user
      sign_in!(@user)
      redirect_to root_url
    else
      flash.now[:errors] = ["Wrong email/password combination"]
      render json: @user.errors.full_messages
    end
  end

  def destroy
    sign_out!
    redirect_to new_session_url
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
