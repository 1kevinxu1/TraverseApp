class Api::UsersController < Api::ApiController
  def index
    @trip = Trip.find(params[:trip_id])
    @trips = @trip.overlapping_trips(10_000, true)
    render :index
  end

  def names
    @users = User.all.map {|user| {label: user.name, id: user.id} }
    render json: @users
  end

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
    params.require(:user).permit(
      :city,
      :state,
      :country,
      :latitude,
      :longtitude,
      :about_blurb,
      :story_blurb,
      :travel_blurb,
      :image_url,
      :birthday
    )
  end
end
