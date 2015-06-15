json.array! @trips do |trip|
  json.extract!(trip, :owner_id, :id, :start_date_string, :end_date_string)
  json.city trip.city.city
  json.state trip.city.state
end
