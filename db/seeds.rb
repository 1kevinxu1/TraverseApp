# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(
  email: "admin",
  password:"password",
  fname: "Kevin",
  lname: "Xu",
  birthday: Date.new(1995,10,10),
  city:"San Diego",
  state:"CA",
  country: "United States",
  latitude: 32.715738,
  longitude: -117.1610838
)

trip = Trip.create!(
  owner_id: admin.id,
  name: "Going Home!",
  start_date: Date.new(2015,7,10),
  end_date: Date.new(2015,7,24),
  city: "San Diego",
  state: "CA",
  country: "United States",
  latitude: 32.715738,
  longitude: -117.1610838
)


birthday_range = [Date.new(1980,1,1), Date.new(1996,6,10)]

cities = [
  {
    city: "Baltimore",
    state: "MD",
    country: "United States",
    latitude: 39.2903848,
    longitude: -76.6121893
  },
  {
    city: "San Diego",
    state: "CA",
    country: "United States",
    latitude: 32.715738,
    longitude: -117.1610838
  },
  {
    city: "Austin",
    state: "TX",
    country: "United States",
    latitude: 30.267153,
    longitude: -97.7430608
  },
  {
    city: "Walla Walla",
    state: "WA",
    country: "United States",
    latitude: 46.0645809,
    longitude: -118.3430209
  },
  {
    city: "San Francisco",
    state: "CA",
    country: "United States",
    latitude: 37.7749295,
    longitude: -122.4194155
  },
  {
    city: "Paris",
    state: "IDF",
    country: "France",
    latitude: 48.856614,
    longitude: 2.35222190000002
  }
]


30.times do
  name = Faker::Name.name.split(' ')
  email = Faker::Internet.free_email(name)
  birthday = Faker::Date.between(*birthday_range)
  about_blurb = Faker::Lorem.paragraph(4)
  story_blurb = Faker::Lorem.paragraph(6)
  travel_blurb = Faker::Lorem.paragraph(3)
  image_url = Faker::Avatar.image

  random_city = cities.sample
  city = random_city[:city]
  state = random_city[:state]
  country = random_city[:country]
  latitude = random_city[:latitude]
  longitude = random_city[:longitude]

  user = User.create(
    email: email,
    password: "password",
    fname: name[0],
    lname: name[1],
    birthday: birthday,
    about_blurb: about_blurb,
    story_blurb: story_blurb,
    travel_blurb: travel_blurb,
    image_url: image_url,
    city: city,
    state: state,
    country: country,
    latitude: latitude,
    longitude: longitude
  )

  end_date = Date.today

  5.times do |index|
    start_date = Faker::Date.between(end_date, end_date + 30)
    end_date = Faker::Date.between(start_date, start_date + 30)

    random_city = cities.sample
    city = random_city[:city]
    state = random_city[:state]
    country = random_city[:country]
    latitude = random_city[:latitude]
    longitude = random_city[:longitude]
    name = "#{name[0]} #{name[1]}'s Sample Trip #{index}"
    owner_id = user.id

    trip = Trip.create!(
      owner_id: owner_id,
      name: name,
      start_date: start_date,
      end_date: end_date,
      city: city,
      state: state,
      country: country,
      latitude: latitude,
      longitude: longitude
    )
  end

end
