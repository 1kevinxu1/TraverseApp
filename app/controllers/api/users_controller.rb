class Api::UsersController < Api::ApiController
  def index
    @trip = Trip.find(params[:trip_id])
    start = Time.now
    @trips = @trip.overlapping_trips(true)
    ActiveRecord::Associations::Preloader.new.preload(@trips, [:city, :user])
    finish = Time.now
    render :index
    p finish-start
      # render json: ["That trip doesn't belong to you"], status: :unauthorized
    # end
  end

  #id in params is the user_id, not profile id
  def show
    @user = User.find(params[:id])
    render :show
  end

  def update
    @user = current_user
    if @user.update_attributes(profile_params)
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :hometown,
      :about_blurb,
      :story_blurb,
      :travel_blurb,
      :image_url,
      :birthday
    )
  end
end
