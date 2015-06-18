json.array! @trips do |trip|
  json.name trip.user.name
  json.city trip.user.city
  json.state trip.user.state
  json.country trip.user.country
  json.age trip.user.age
  json.trip_id trip.id
  json.id trip.owner_id
  json.image_url trip.user.image_url
end
