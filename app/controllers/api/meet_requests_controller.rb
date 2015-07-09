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
      status = params[:meet_request][:status]
      respond_to_request(@meet_request, status)
    else
      render json: ["You can only accept requests on behalf of your own trips"],
      status: unauthorized
    end
  end

  private

  def generate_corresponding_request(meet_request, status)
    corresponding_trip =
      meet_request.requested_trip.overlapping_trips(30, false, meet_request.requester_id).first
    if status != 'PENDING'
      MeetRequest.create(
        requester_id: current_user.id,
        requested_trip_id: corresponding_trip.id,
        status: status
      )
      generate_friendship(meet_request) if status == 'ACCEPTED'
    end
    render json: meet_request
  end

  def generate_friendship(meet_request)
    unless current_user.friends.include?(meet_request.requester)
      UserFriendship.create(
        from_user_id: meet_request.requester_id,
        to_user_id: current_user.id
      )
      UserFriendship.create(
        from_user_id: current_user.id,
        to_user_id: meet_request.requester_id
      )
    end
  end

  def respond_to_request(meet_request, status)
    if meet_request.update_attributes(update_params)
      generate_corresponding_request(meet_request, status)
    else
      render json: meet_request.errors.full_messages,
      status: :unprocessable_entity
    end
  end

  def request_params
    params.require(:meet_request).permit(:requested_trip_id, :status)
  end

  def update_params
    params.require(:meet_request).permit(:status)
  end

end
