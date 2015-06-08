# Phase 1: User Authentication, User Profiles

## Rails
### Models
* User
* Profile
* Trip

### Controllers
* API::UsersController (create)
* API::ProfilesController (create, show)
* SessionsController (create, new, destroy)

### Views
* index.html.erb
* static_pages/root.html.erb
* profiles/show.json.jbuilder

## Backbone
### Models
* User
* Profile

### Collections

### Views
* UserPortal (Composite View, toggles SignUp and LogIn subviews)
* LogIn
* SignUp
* ProfileView (Composite View, contains either ProfileBlurbItem
  or ProfileBlurbForm subviews)
* ProfileBlurbItem
* ProfileBlurbForm

## Gems/Libraries
