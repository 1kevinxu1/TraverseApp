class Api::MeetRequestsController < Api::ApplicationController
  def create
    @meet_request = MeetRequest.new(request_params)
    @meet_request.requester_id = current_user.id
  end

  def update
  end

  private

  def request_params
    params.require(:request).permit(:trip_id, :status)
  end

end
