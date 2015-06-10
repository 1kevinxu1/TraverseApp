class Api::ProfilesController < ApplicationController
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      render json: ["Profile saved!"]
    else
      render json: @profile.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @profile = current_user.profile
    render :show
  end

  def update
    @profile = current_user.profile
    if @profile.update_attibutes(profile_params)
      render json: ["Profile updated!"]
    else
      render json: @profile.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permits(
      :hometown_id,
      :about_blurb,
      :story_blurb,
      :travel_blurb,
      :image_url
    )
  end
end
