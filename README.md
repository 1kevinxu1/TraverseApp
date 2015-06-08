# Traverse

[Heroku link][heroku]

[heroku]: http://traverse-app.herokuapp.com

## Minimum Viable Product
Travserse is an app inspired by Couchsurfing and Meetup built on Rails and
Backbone. Users can:

<!-- This is a Markdown checklist. Use it to keep track of your progress! -->

- [ ] Create accounts
- [ ] Create sessions (log in)
- [ ] Create trips
- [ ] Create blog posts
- [ ] View profiles
- [ ] View trips
- [ ] Search for Users by trip overlaps
- [ ] Connect and request to meet other users
- [ ] View sidebar

## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

## Implementation Timeline

### Phase 1: User Authentication, Profile Creation (~2-3 days)
I will implement user authentication in Rails based on the practices learned at
App Academy. By the end of this phase, users will be able to toggle sign up and
log in, and create a profile once logged in using a backbone view. I will create
API routes that will enable the backbone calls to persist to the database. The
most important part of this phase will be pushing the app to Heroku and ensuring
that everything works before moving on to phase 2.

[Details][phase-one]

### Phase 2: City Database Integration and Creating Trips (~1-2 days)
I will add API routes to allow creating, showing, and destroying trips. Then, I
will add a Backbone model and collection that fetch data from those routes for
trips. By the end of this phase, users will be able to create, see, edit, and
destroy trips from a single page.

[Details][phase-two]

### Phase 3: Trip Search, User Matching, and Request Meetings (~2-3 days)
I will create a trip searching functionality, which will show a list of all the
users who have overlapping trips with the current user. First, I will add a search
route to the trips controller. Then, I will add a backbone collection of users
that will be rendered in a backbone composite view. I will then add user request
functionality, where users can request to meet with other users on their trips,
and be notified when other users have requested to meet them. To display this
information, I will change the TripShow subview to a composite view that will
display incoming requests.

[Details][phase-three]

### Phase 4: Sidebar and User Interests (~1-2 days)
In this phase, I will allow users to upload images and choose interests. To start,
I will utilize the 'gravatar' and 'filepicker' gems, to allow users to upload and
size their profile pictures accordingly. Then, I will create a sidebar view that
will display their profile picture and interests on the side of the page, in a
composite view.

[Details][phase-four]

### Bonus Features (TBD)
- [ ] Typeahead search bar
- [ ] Advanced guest log in functionality (choose who to log in as)
- [ ] "Friends" integration — keep a list of everyone you have met up with
- [ ] Deprecated trip views - find and interact with trips that have past
- [ ] Pagination/infinite scroll
- [ ] Integrating in-app chat/messaging system

[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
