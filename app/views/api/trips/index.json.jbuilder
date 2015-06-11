json.array! @trips do |trip|
  json.extract!(trip, trip.user.id, :from_city, :to_city, :start_date, :end_date)
end
