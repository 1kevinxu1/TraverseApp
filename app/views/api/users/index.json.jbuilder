json.array! @trips do |trip|
  json.trip_name trip.name
  json.name trip.user.name
  json.city trip.city
  json.state trip.state
  json.country trip.country
  json.age trip.user.age
  json.trip_id trip.id
  json.id trip.owner_id
  json.image_url trip.user.image_url
  json.distance trip.distance
  json.start_date trip.start_date_string
  json.end_date trip.end_date_string
end
