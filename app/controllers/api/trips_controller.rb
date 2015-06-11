class Api::TripsController < ApplicationController
  def index
    @trips = current_user.trips.order(:start_date)
    render :index
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.owner_id = current_user.id
    if @trip.save
      render :show
    else
      render json: @trip.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(trip_params)
      render json: @trip
    else
      render json: @trip.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    render json: ["Trip deleted."]
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :from_city, :to_city)
  end
end
