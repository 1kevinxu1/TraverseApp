class Api::ProfilesController < ApplicationController

  #id in params is the user_id, not profile id
  def show
    @profile = Profile.find_by_user_id(params[:id])
    render :show
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(profile_params)
      render json: ["Profile updated!"]
    else
      render json: @profile.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :hometown_id,
      :about_blurb,
      :story_blurb,
      :travel_blurb,
      :image_url
    )
  end
end
