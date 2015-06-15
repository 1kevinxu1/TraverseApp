class Api::MeetRequestsController < Api::ApiController
  def create
    @meet_request = MeetRequest.new(request_params)
    @meet_request.requester_id = current_user.id
    if @meet_request.save
      render json: @meet_request
    else
      render json: @meet_request.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @meet_request = MeetRequest.find(params[:id])
    if @meet_request.requested_trip.user == current_user
      if @meet_request.update_attributes(update_params)
        corresponding_trip =
          @meet_request.requested_trip.overlapping_trips(false, @meet_request.requester_id).first
        if params[:meet_request][:status] != 'PENDING'
          MeetRequest.create(
            requester_id: @meet_request.requested_trip.owner_id,
            requested_trip_id: corresponding_trip.id,
            status: params[:meet_request][:status]
          )
        end
        render json: @meet_request
      else
        render json: @meet_request.errors.full_messages,
        status: :unprocessable_entity
      end
    else
      render json: ["You can only accept requests on behalf of your own trips"],
      status: unauthorized
    end
  end

  private

  def request_params
    params.require(:meet_request).permit(:requested_trip_id, :status)
  end

  def update_params
    params.require(:meet_request).permit(:status)
  end

end
