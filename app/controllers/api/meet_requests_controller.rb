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
  end

  private

  def request_params
    params.require(:meet_request).permit(:requested_trip_id, :status)
  end

end
