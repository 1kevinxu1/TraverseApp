json.array! @trips do |trip|
  json.name trip.user.name
  json.hometown trip.user.hometown
  json.age trip.user.age
  json.trip_id trip.id
  json.id trip.owner_id
end
