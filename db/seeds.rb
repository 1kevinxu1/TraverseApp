# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

City.connection.execute("COPY cities FROM '#{Dir.pwd}/db/cities.csv' DELIMITER ',' CSV;")

birthday_range = [Date.new(1980,1,1), Date.new(1996,6,10)]

zips = ["san diego", "san francisco", "new york", "austin", "baltimore", "encinitas", "boston"]

30.times do
  name = Faker::Name.name.split(' ')
  email = Faker::Internet.free_email(name)
  birthday = Faker::Date.between(*birthday_range)

  hometown = zips.sample
  about_blurb = Faker::Lorem.paragraph(4)
  story_blurb = Faker::Lorem.paragraph(6)
  travel_blurb = Faker::Lorem.paragraph(3)
  image_url = Faker::Avatar.image

  user = User.create(
    email: email,
    password: "password",
    fname: name[0],
    lname: name[1],
    birthday: birthday,
    hometown: hometown,
    about_blurb: about_blurb,
    story_blurb: story_blurb,
    travel_blurb: travel_blurb,
    image_url: image_url
  )

  end_date = Date.today

  5.times do
    start_date = Faker::Date.between(end_date, end_date + 30)
    end_date = Faker::Date.between(start_date, start_date + 30)
    city = zips.sample
    owner_id = user.id
    trip = Trip.create!(
      owner_id: owner_id,
      city: city,
      start_date: start_date,
      end_date: end_date
    )
  end

end
