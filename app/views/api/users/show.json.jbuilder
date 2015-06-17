json.extract!(@user, :name, :age, :city, :state, :country, :about_blurb, :story_blurb, :travel_blurb, :image_url)
json.fname @user.fname.capitalize

if @user != current_user
  json.shared_trips current_user.trips do |trip|
    trip.overlapping_trips(false, @user.id).each do |their_trip|
      json.extract!(their_trip, :name, :start_date_string, :end_date_string, :id, :city, :state, :country)
      json.request MeetRequest.find_by(requester_id: current_user.id, requested_trip_id: their_trip.id)
      json.their_request MeetRequest.find_by(requester_id: @user.id, requested_trip_id: trip.id)
    end
  end
end
