class Api::TripsController < ApplicationController
  def index
    @trips = current_user.trips.order(:start_date)
    render :index
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      render json: ["Trip created! Have fun!"]
    else
      render json: @trip.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(trip_params)
      render json: ["Trip saved! Enjoy your trip!"]
    else
      render json: @trip.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    render json: ["Trip deleted."]
  end
end
