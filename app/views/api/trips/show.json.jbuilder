json.extract!(
  @trip, :id, :start_date_string, :end_date_string, :city, :state, :name
)
json.owner_name @trip.user.name
json.pending_requests @trip.pending_requests do |request|
  user = request.requester
  json.name user.name
  json.age user.age
  json.image_url user.image_url
  json.request request
end
json.accepted_requests @trip.accepted_requests do |request|
  user = request.requester
  json.image_url user.image_url
end
