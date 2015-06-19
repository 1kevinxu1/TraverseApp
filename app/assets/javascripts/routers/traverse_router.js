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
    this.user = new Traverse.Models.User({id: Traverse.userId});
  },

  tripIndex: function() {
    var mainview = new Traverse.Views.TripsIndex({collection: this._userTrips});
    var sideview = new Traverse.Views.ProfileSidebar({ model: this.user });
    this.user.fetch();
    this._userTrips.fetch();
    this._swapView(this.$mainview, this._mainview, mainview);
    this._swapView(this.$sideview, this._sideview, sideview);
    $('.content-header').html($("<h3>").text("Your Trips"));
  },

  editProfile: function() {
    var mainview = new Traverse.Views.ProfileEdit({model: this.user });
    var sideview = new Traverse.Views.ProfileSidebar({ model: this.user });
    this.user.fetch();
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
    var users = new Traverse.Collections.Users();
    var mainview = new Traverse.Views.SearchResults({collection: users});
    var sideview = new Traverse.Views.ProfileSidebar({ model: this.user });
    users.fetch({ data: { trip_id: tripId }, processData: true });
    this.user.fetch();
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
