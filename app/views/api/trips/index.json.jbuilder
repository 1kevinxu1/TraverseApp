json.array! @trips do |trip|
  json.extract!(trip, :owner_id, :id, :start_date_string, :end_date_string, :city)
end
