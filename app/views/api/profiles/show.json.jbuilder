json.extract!(@profile, :hometown, :about_blurb, :story_blurb, :travel_blurb, :image_url)
json.name @profile.user.name
json.age @profile.user.age
