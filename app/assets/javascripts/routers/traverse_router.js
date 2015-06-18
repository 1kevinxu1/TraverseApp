Traverse.Routers.Router = Backbone.Router.extend({

  routes: {
    '': 'tripIndex',
    'profile/edit(/)': 'editProfile',
    'profile/:id(/)': 'showProfile',
    'search/:id(/)': 'searchTrips'
  },

  initialize: function(options) {
    this.$mainview = options.$mainview;
    this.$sideview = options.$sideview;
    this._userTrips = new Traverse.Collections.Trips();
  },

  tripIndex: function() {
    var user = new Traverse.Models.User({id: Traverse.userId});
    var mainview = new Traverse.Views.TripsIndex({collection: this._userTrips});
    var sideview = new Traverse.Views.ProfileSidebar({ model: user });
    user.fetch();
    this._userTrips.fetch();
    this._swapView(this.$mainview, this._mainview, mainview);
    this._swapView(this.$sideview, this._sideview, sideview);
    $('.content-header').html($("<h3>").text("Your Trips"));
  },

  editProfile: function() {
    var user = new Traverse.Models.User({id: Traverse.userId});
    var mainview = new Traverse.Views.ProfileEdit({model: user});
    var sideview = new Traverse.Views.ProfileSidebar({ model: user });
    user.fetch();
    this._swapView(this.$mainview, this._mainview, mainview);
    this._swapView(this.$sideview, this._sideview, sideview);
    $('.content-header').html($("<h3>").text("Edit Profile"));
  },

  showProfile: function(id) {
    var user = new Traverse.Models.User({id: id});
    var mainview = new Traverse.Views.ProfileShow({ model: user });
    var sideview = new Traverse.Views.ProfileSidebar({ model: user });
    user.fetch();
    this._swapView(this.$mainview, this._mainview, mainview);
    this._swapView(this.$sideview, this._sideview, sideview);
    $('.content-header').html($("<h3>").text("Profile"));
  },

  searchTrips: function(tripId) {
    var user = new Traverse.Models.User({id: Traverse.userId});
    var users = new Traverse.Collections.Users();
    user.fetch();
    users.fetch({ data: { trip_id: tripId }, processData: true });
    var mainview = new Traverse.Views.SearchResults({collection: users});
    var sideview = new Traverse.Views.ProfileSidebar({ model: user });
    this._swapView(this.$mainview, this._mainview, mainview);
    this._swapView(this.$sideview, this._sideview, sideview);
    $('.content-header').html($("<h3>").text("User Matches for Trip"));
  },

  _swapView: function(pageElement, viewToReplace, currentView ) {
    viewToReplace && viewToReplace.remove();
    viewToReplace = currentView;
    pageElement.html(currentView.$el);
    currentView.render();
  }

});
