user = current_user

json.array! @trips do |trip|
  json.name user.name
  json.age user.age
  json.id user.id
  json.hometown user.hometown
end
