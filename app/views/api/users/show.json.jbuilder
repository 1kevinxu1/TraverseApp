json.extract!(@user, :name, :age, :hometown, :about_blurb, :story_blurb, :travel_blurb, :image_url)
json.fname @user.fname.capitalize

# if user != current_user
#   json.array! current_user.trips do |trip|
#     debugger;
#     json.trip trip.overlapping_trips(false, user.id).first
#   end
# end
