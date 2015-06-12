class Api::UsersController < ApplicationController
  def index
    @trip = Trip.find(params[:id])
    @trips = @trip.overlapping_trips(true)
    render :index
  end
end
