json.extract!(trip, :start_date_string, :end_date_string)
json.from_city trip.from_city.city
json.to_city trip.to_city.city 
