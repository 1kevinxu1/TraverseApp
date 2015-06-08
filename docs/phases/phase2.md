# Phase 2: Creating Trips

## Rails
### Models

### Controllers
Api::TripsController (create, destroy, edit, index)

### Views
trips/index.json.jbuilder

## Backbone
### Models
* Trip

### Collections
* Trips

### Views
* TripView (Composite View, contains TripItem subviews)
* TripItem (contains two templates, TripItemShow and TripItemForm, which toggle)
* TripItemShow
* TripItemForm

## Gems/Libraries
http://simplemaps.com/resources/us-cities-data
