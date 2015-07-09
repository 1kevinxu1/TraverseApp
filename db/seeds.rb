# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Interest.create!([
  {name: "Surfing"},
  {name: "Poker"},
  {name: "Programming"},
  {name: "Web Development"},
  {name: "Hiking"},
  {name: "Nightlife"},
  {name: "Arts & Culture"},
  {name: "Music"},
  {name: "Food"},
  {name: "Entreprenuership"}
])

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


trip = Trip.create!(
  owner_id: admin.id,
  name: "Coming Back!",
  start_date: Date.new(2015,7,25),
  end_date: Date.new(2015,8,12),
  city: "Baltimore",
  state: "MD",
  country: "United States",
  latitude: 39.2903848,
  longitude: -76.6121893
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


30.times do |index|
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
    trip_name = "#{name[0]} #{name[1]}'s Sample Trip #{index}"
    owner_id = user.id

    trip = Trip.create!(
      owner_id: owner_id,
      name: trip_name,
      start_date: start_date,
      end_date: end_date,
      city: city,
      state: state,
      country: country,
      latitude: latitude,
      longitude: longitude
    )
  end

  Interest.all.each do |interest|
    if Random.rand(2) == 1
      UserInterest.create!(user_id: user.id, interest_id: interest.id)
    end
  end
end

Trip.first.overlapping_trips(30, true).each do |trip|
  MeetRequest.create!(
    requester_id: trip.user.id,
    requested_trip_id: 1,
    status: "PENDING"
  )
end

Trip.second.overlapping_trips(30, true).each do |trip|
  MeetRequest.create!(
    requester_id: trip.user.id,
    requested_trip_id: 2,
    status: "PENDING"
  )
end
#
#   {name: "Honor"},
#   {name: "My Hand"},
#   {name: "Keeping Oaths"},
#   {name: "Brienne"},
#   {name: "Living"},
#   {name: "Alcoholic Beverages"},
#   {name: "Women"},
#   {name: "Talking"},
#   {name: "Politics"},
#   {name: "Dragons"},
#   {name: "My Brother"},
#   {name: "My Brother Tyrion"},
#   {name: "My Sister Cersei"},
#   {name: "Running"},
#   {name: "Ping Pong"},
#   {name: "Shrimping"},
#   {name: "My Momma"},
#   {name: "Jenny"},
#   {name: "My Friend Bubba"},
#   {name: "Chocolate"},
#   {name: "Magic"},
#   {name: "Quidditch"},
#   {name: "Learning"},
#   {name: "Defense Against The Dark Arts"},
#   {name: "Occulemency"},
#   {name: "Owls"},
#   {name: "House Elves"}
# ])
# MeetRequest.create!([
#   {requester_id: 2, requested_trip_id: 1, status: "PENDING"},
#   {requester_id: 3, requested_trip_id: 7, status: "PENDING"},
#   {requester_id: 3, requested_trip_id: 4, status: "PENDING"},
#   {requester_id: 3, requested_trip_id: 1, status: "PENDING"},
#   {requester_id: 4, requested_trip_id: 9, status: "PENDING"},
#   {requester_id: 4, requested_trip_id: 2, status: "PENDING"}
# ])
# Trip.create!([
#   {owner_id: 1, name: "Going back to Kings Landing", start_date: "2016-07-01", end_date: "2016-07-28", city: "San Diego", state: "CA", country: "United States", longitude: -117.1610838, latitude: 32.715738},
#   {owner_id: 1, name: "That wasn't Kings Landing", start_date: "2016-07-29", end_date: "2016-08-22", city: "San Francisco", state: "CA", country: "United States", longitude: -122.4194155, latitude: 37.7749295},
#   {owner_id: 1, name: "Where is Kings Landing?", start_date: "2016-08-23", end_date: "2016-09-12", city: "Cape Town", state: "", country: "South Africa", longitude: 18.425063, latitude: -33.922151},
#   {owner_id: 1, name: "Looks like I'm not in Westeros", start_date: "2016-09-24", end_date: "2016-10-10", city: "Wuxi", state: "Jiangsu", country: "China", longitude: 120.31191, latitude: 31.49117},
#   {owner_id: 2, name: "Visiting the Nights Watch!", start_date: "2016-06-02", end_date: "2016-06-08", city: "Juneau", state: "AK", country: "United States", longitude: -134.4197222, latitude: 58.3019444},
#   {owner_id: 2, name: "That wasn't the Nights Watch", start_date: "2016-07-02", end_date: "2016-07-16", city: "San Diego", state: "CA", country: "United States", longitude: -117.1610838, latitude: 32.715738},
#   {owner_id: 2, name: "At least I'm not in a crate", start_date: "2016-07-17", end_date: "2016-08-28", city: "San Francisco", state: "CA", country: "United States", longitude: -122.4194155, latitude: 37.7749295},
#   {owner_id: 3, name: "Cross country run", start_date: "2016-07-20", end_date: "2016-08-21", city: "San Diego", state: "CA", country: "United States", longitude: -117.1610838, latitude: 32.715738},
#   {owner_id: 3, name: "Coastal fishing trip", start_date: "2016-08-23", end_date: "2016-09-12", city: "San Francisco", state: "CA", country: "United States", longitude: -122.4194155, latitude: 37.7749295},
#   {owner_id: 3, name: "International Ping Pong tournament", start_date: "2016-09-16", end_date: "2016-10-12", city: "Wuxi", state: "Jiangsu", country: "China", longitude: 120.31191, latitude: 31.49117},
#   {owner_id: 4, name: "Normal peoples stuff trip", start_date: "2016-07-17", end_date: "2016-09-01", city: "San Francisco", state: "CA", country: "United States", longitude: -122.4194155, latitude: 37.7749295}
# ])
# User.create!([
#   {email: "tyrionlannister@kingslanding.com", password_digest: "$2a$10$vvm37RjSTJZzO7PbsB10G.T0f.vaJztODbesFTT8XB7EdyQ6ZtzWa", session_digest: "DYcTP7-hCG4THMb_wgL5zQ", fname: "Tyrion", lname: "Lannister", birthday: "1988-08-02", image_url: "http://res.cloudinary.com/traverse/image/upload/x_502,y_0,w_903,h_903,c_crop/v1435045819/omxrbyxlc7vs2qviqrjm.jpg", about_blurb: "I'm funny, talkative, and I've been told, pretty charming. I'm also quite rich, so we can do lots of fun things together wherever we go! I'm currently single and I'd love to mingle, and I'm not very picky when it comes to girls I'd like to date. I'm not really looking to settle down, however, as I have a lot of emotional baggage from my past. Hopefully, height is not an issue for you, because I'm a dwarf.", story_blurb: "Well this one time, I was at my nephews wedding (FYI I don't like this guy at all, I was pretty much forced to be there). Everyone was having a grand ol' time (but me, that's a longer story I'll have to save for later). Everything was going smoothly, pretty boring but miserable ordeal, and we get to the wedding pie. Some guy eats it and starts choking. No big deal, right? WRONG. Turns out, that pie was poisoned! Worst part, everyone thought it was me! What gives? So eventually I was imprisoned for questioning and was locked up for a few days. However, my lawyer, good friend of mine, figured out a way to uh, break me out. I'm not really supposed to talk about it, but it was TOTALLY legal. Just message me if you want to hear the rest in person.", travel_blurb: "Stay of out crates. Find places with lots of nightlife and entertainment. I try to avoid places that are too rowdy though; I always find myself in bar fights and I'm too small too really defend myself. I just end up saying all the wrong things when I'm drunk. ", city: "San Francisco", state: "CA", country: "United States", longitude: -122.4194155, latitude: 37.7749295},
#   {email: "forrestgump@jennay.com", password_digest: "$2a$10$5JxdP/CTrVYnocM3XEfuWudJw3CentCPaZoPbNrJInl5ax9EPEFTa", session_digest: "VQmpyD8RQQ40DR-BeEZlMA", fname: "Forrest", lname: "Gump", birthday: "1982-06-06", image_url: "http://res.cloudinary.com/traverse/image/upload/x_38,y_3,w_239,h_239,c_crop/v1435047925/vj5t4g0azjxanxwiwffa.jpg", about_blurb: "I'm not a very smart man, but I know what love is. ", story_blurb: "I remember the first time I heard the sweetest voice in the wide world: \"You can sit here if you want\" I had never seen anything so beautiful in my entire life. She was like an angel. I just sat next to her on that bus and had a conversation with her all the way to school. Next to momma, no one talked to me or asked me questions. From that day on, we was always together. Jenny and me was like peas and carrots. And that was how I met my most special friend in the whole wide world.", travel_blurb: "Make lotsa friends. I like talking to people, even though they don't always like talking to me. But at least I met Jenny! And Bubba. And Lieutenant Dan.", city: "Greenville", state: "AL", country: "United States", longitude: -86.6177517, latitude: 31.8295972},
#   {email: "jaimelannister@kingslanding.com", password_digest: "$2a$10$Ni5Lj6DrleSp7iKVKOq6HeChFxPSup/2XPYQUBEBSsdY.qHRCtvKe", session_digest: "7W1QCkf_IFupAA5JbVL60g", fname: "Jaime", lname: "Lannister", birthday: "1980-02-12", image_url: "http://res.cloudinary.com/traverse/image/upload/x_34,y_0,w_295,h_295,c_crop/v1435045279/gaef9r7wjafqkuxe0p2g.jpg", about_blurb: "I know you've probably heard a bunch of nasty things about me. But I'm a nice guy at heart, I really am. I just... forget it. You've probably already judged me anyways and nothing I can say will change your mind. ", story_blurb: "Alright, I KNOW you guys won't believe this. But back during the war of Robert's Rebellion, I was a kingsguard, as some of you might know. Close to the end of it, the king was losing, right? And he started going crazy. Like seriously crazy! Anyways, I was in the war room when he started talking about wanting to... how should I put this... \"renovate\" the whole city. In the middle of the war! I didn't believe he was serious at first, and couldn't take it anymore. I had to stand up for what's right. So I quit my job then and there. But he wouldn't let me, and tried to block the exit! So I had to get physical with him. You would have done the same thing. But now it seems like the only thing people remember about that incident was how I punched my boss in the face.", travel_blurb: "Keep my remaining hand, preferably. Last time when I was traveling I ended up being kidnapped by some cartel of some sort! They wanted to ransom away me and my friend, Brienne. Anyways, I was getting desperate and I tried to escape. They cut my hand as punishment before I was saved by the city police or something. My memory is pretty hazy from that incident since I went into shock. Maybe that should have been my crazy story.", city: "San Francisco", state: "CA", country: "United States", longitude: -122.4101149, latitude: 37.7965168},
#   {email: "harrypotter@hogwarts.com", password_digest: "$2a$10$G0GVn.gYYlXSu7rAZDy5LOU85mith/CgYGU1gJ62LN/uKK4wDRouu", session_digest: "Z2x9QswlsmJqTJD89EQKUQ", fname: "Harry", lname: "Potter", birthday: "1990-07-31", image_url: "http://res.cloudinary.com/traverse/image/upload/x_249,y_23,w_177,h_177,c_crop/v1435049092/jpbnlkc5x7mptjc4cm1n.jpg", about_blurb: "People call me the \"chosen one\",  \"the boy who lived\", etc. but I'm really just a normal boy with a really unfortunate past. I've tried my whole life to move past that, so please don't bring it up when you're around me.", story_blurb: "Well, once when I was in my second year studying at Hogwarts, Ginny (my wife, but we weren't dating then) found this diary that ended up being a piece of my mortal enemy's soul! He ended up possessing her and forcing her to release some crazy evil stuff in the school bathrooms. People were so scared of this thing—they were PETRIFIED! It turned out to be this massive snake. Anyways, the crazy part was I actually went down in the school sewage to kill this thing! I know it's not very believable, but I actually killed the thing—stabbed it through the roof of its mouth with a sword that magically appeared! I'm not crazy, I swear...", travel_blurb: "Just keep a low profile. I'd like to just visit some museums, do some shopping, explore caves for fun, and not to destroy evil magical artifacts, you know—normal people stuff. Whatever that is.", city: "London", state: "England", country: "United Kingdom", longitude: -0.122561099999984, latitude: 51.5309004}
# ])
# UserInterest.create!([
#   {user_id: 1, interest_id: 2},
#   {user_id: 1, interest_id: 3},
#   {user_id: 1, interest_id: 4},
#   {user_id: 1, interest_id: 5},
#   {user_id: 2, interest_id: 7},
#   {user_id: 2, interest_id: 8},
#   {user_id: 2, interest_id: 9},
#   {user_id: 2, interest_id: 10},
#   {user_id: 2, interest_id: 11},
#   {user_id: 2, interest_id: 12},
#   {user_id: 2, interest_id: 13},
#   {user_id: 1, interest_id: 14},
#   {user_id: 1, interest_id: 15},
#   {user_id: 3, interest_id: 16},
#   {user_id: 3, interest_id: 17},
#   {user_id: 3, interest_id: 18},
#   {user_id: 3, interest_id: 19},
#   {user_id: 3, interest_id: 22},
#   {user_id: 4, interest_id: 23},
#   {user_id: 4, interest_id: 24},
#   {user_id: 4, interest_id: 26},
#   {user_id: 4, interest_id: 27},
#   {user_id: 4, interest_id: 28},
#   {user_id: 4, interest_id: 29}
# ])
