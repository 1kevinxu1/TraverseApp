json.extract!(@user, :name, :age, :hometown, :about_blurb, :story_blurb, :travel_blurb, :image_url)
json.fname @user.fname.capitalize

if @user != current_user
  json.shared_trips current_user.trips do |trip|
    json.trip trip.overlapping_trips(false, @user.id).first
    json.city trip.city
  end
end
