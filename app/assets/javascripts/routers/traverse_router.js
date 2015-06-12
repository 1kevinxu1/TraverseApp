Traverse.Routers.Router = Backbone.Router.extend({

  routes: {
    '': 'tripIndex',
    'profile/edit(/)': 'editProfile',
    'profile/:id(/)': 'showProfile',
    'search/:id(/)': 'overlappingTrips'
  },

  initialize: function(options) {
    this.$mainview = options.$mainview;
    this.$sideview = options.$sideview;
    this._userTrips = new Traverse.Collections.Trips();
    this._userTrips.fetch();
  },

  tripIndex: function() {
    var view = new Traverse.Views.TripsIndex({collection: this._userTrips});
    this._swapView(this.$mainview, this._mainview, view);
  },

  editProfile: function() {
    var profile = new Traverse.Models.Profile({id: Traverse.userData.id});
    profile.fetch();
    var view = new Traverse.Views.ProfileEdit({model: profile});
    this._swapView(this.$mainview, this._mainview, view);
  },

  showProfile: function(id) {
    var profile = new Traverse.Models.Profile({id: id});
    profile.fetch();
    var view = new Traverse.Views.ProfileShow({model: profile});
    this._swapView(this.$mainview, this._mainview, view);
  },

  overlappingTrips: function(tripId) {
    var users = new Traverse.Collections.Users();
    users.fetch({
      data: { id: tripId },
      processData: true
    });
    var view = new Traverse.Views.SearchResults({collection: users});
    this.swapView(this.$mainview, this._mainview, view);
  },

  _swapView: function(pageElement, viewToReplace, currentView ) {
    viewToReplace && viewToReplace.remove();
    viewToReplace = currentView;
    pageElement.html(currentView.render().$el);
  }

});
