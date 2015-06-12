json.array! @trips do |trip|
  json.user trip.user
  json.hometown trip.user.profile.hometown
end
