# Schema Information

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
email           | string    | not null, unique
password_digest | string    | not null
session_token   | string    | not null, unique

## profile
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
fname           | string    | not null
lname           | string    | not null
about_blurb     | text      |
story_blurb     | text      |
travel_blurb    | text      |
image_url       | string    | default: "/assets/default_avatar.png"

## cities (from http://simplemaps.com/resources/us-cities-data)
column name     | data type | details
----------------|-----------|-----------------------
zipcode         | integer   | not null, primary key
state           | string    | not null
city            | string    | not null
lat             | float     | not null
long            | float     | not null

## trips
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
owner_id        | integer   | not null, foreign key: (references users)
from_city_zip   | integer   | not null, foreign key: (references cities)
to_city_zip     | integer   | not null, foreign key: (references cities)
start_date      | date      | not null
end_date        | date      | not null

## meet_requests
column name       | data type | details
------------------|-----------|-----------------------
id                | integer   | not null, primary key
requester_id      | integer   | not null, foreign key: (references users)
requested_trip_id | integer   | not null, foreign key: (references trips)
status            | string    | not null

## Bonus: Not top priority

## traveled_to_tags
column name  | data type | details
-------------|-----------|-----------------------
id           | integer   | not null, primary key
city_zip     | integer   | not null, foreign key: (references cities)
user_id      | integer   | not null, foreign key: (references users)

##
column name  | data type | details
-------------|-----------|-----------------------
