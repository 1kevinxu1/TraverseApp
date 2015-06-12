json.extract!(@user, :name, :age, :hometown, :about_blurb, :story_blurb, :travel_blurb, :image_url)
json.fname @user.fname.capitalize

if @user != current_user
  json.shared_trips current_user.trips do |trip|
    json.trip do
      trip.overlapping_trips(false, @user.id).each do |current_trip|
        json.extract!(current_trip, :start_date_string, :end_date_string, :id)
        json.extract!(trip.city, :city, :state)
      end
    end
  end
end
