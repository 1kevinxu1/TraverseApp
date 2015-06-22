json.array! @trips do |trip|
  json.extract!(
    trip,
    :id,
    :start_date_string,
    :end_date_string,
    :city,
    :state, 
    :country,
    :name,
    :start_date
  )
end
