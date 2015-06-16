class SessionsController < ApplicationController
  before_action :logged_in?, only: [:create]

  def create
    @user = User.find_by_credentials(*login_params)
    if @user
      sign_in!(@user)
      render json: @user
    else
      render json:["invalid username/password combination"], status: :unprocessable_entity
    end
  end

  def destroy
    sign_out!
    redirect_to new_session_url
  end

  private

  def login_params
    [params[:user][:email], params[:user][:password]]
  end
end
