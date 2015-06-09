class SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(params[:user][:email],
                                     params[:user][:password])
    if @user
      sign_in!(@user)
      redirect_to root_url
    else
      render json: @user.errors.full_messages, status: :forbidden
    end
  end

  def destroy
    sign_out!
    redirect_to root_url
  end

end
