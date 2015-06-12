class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in!(@user)
      Profile.create(user_id: current_user.id)
      redirect_to root_url
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :fname, :lname, :birthday)
  end

end
