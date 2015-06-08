# Phase 1: User Authentication, Basic Blogs and Posts

## Rails
### Models
* User
* Profile
* Trip

### Controllers
* API::UsersController (create, new)
* API::ProfilesController (create, new, show)
* SessionsController (create, new, destroy)

### Views
* index.html.erb
* static_pages/root.html.erb

## Backbone
### Models
* User
* Profile

### Collections

### Views
* User Portal (Composite View, toggles Sign Up and Log In views)
* Log In
* Sign Up
* Index View (Composite View, contains an empty sidebar div and Profile Show view)
* Profile View (Composite View, contains either Profile Blurb Items or Profile Blurb Forms)
* Profile Blurb Item
* Profile Blurb Form

## Gems/Libraries
