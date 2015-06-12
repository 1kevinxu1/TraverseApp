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
    this.$flashview = options.$flashview;
    this._userTrips = new Traverse.Collections.Trips();
    this._userTrips.fetch({
      success: function () {
        this.displayTripInFlashView(this._userTrips.first());
      }.bind(this)
    });
  },

  tripIndex: function() {
    var view = new Traverse.Views.TripsIndex({collection: this._userTrips});
    this._swapView(this.$mainview, this._mainview, view);
    $('.content-header').html($("<h3>").text("Your Trips"));
  },

  editProfile: function() {
    var user = new Traverse.Models.User({id: Traverse.userId});
    user.fetch({
      success: function() {
        var view = new Traverse.Views.ProfileEdit({model: user});
        this._swapView(this.$mainview, this._mainview, view);
      }.bind(this)
    });
    $('.content-header').html($("<h3>").text("Edit Profile"));

  },

  showProfile: function(id) {
    var user = new Traverse.Models.User({id: id});
    user.fetch({
      success: function() {
        var view = new Traverse.Views.ProfileShow({
          model: user
        });
        this._swapView(this.$mainview, this._mainview, view);
      }.bind(this)
    });
    $('.content-header').html($("<h3>").text("Profile"));
  },

  searchTrips: function(tripId) {
    var users = new Traverse.Collections.Users();
    users.fetch({
      data: { trip_id: tripId },
      processData: true,
      success: function() {
        var view = new Traverse.Views.SearchResults({collection: users});
        this._swapView(this.$mainview, this._mainview, view);
        $('.content-header').html($("<h3>").text("User Matches for Trip"));
      }.bind(this)
    });
  },

  displayTripInFlashView: function (trip) {
    var flashview = new Travese.Views.TripFlashView({ model: trip })
    this._swapView(this.$flashview, this._flashview, flashview);
  },

  _swapView: function(pageElement, viewToReplace, currentView ) {
    viewToReplace && viewToReplace.remove();
    viewToReplace = currentView;
    pageElement.html(currentView.render().$el);
  }

});
