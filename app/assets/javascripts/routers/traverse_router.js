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
    debugger;
    var user = new Traverse.Models.User({id: Traverse.userId});
    user.fetch({
      success: function() {
        var view = new Traverse.Views.ProfileEdit({model: user});
        this._swapView(this.$mainview, this._mainview, view);
      }.bind(this)
    });
  },

  showProfile: function(id) {
    var user = new Traverse.Models.User({id: id});
    user.fetch({
      success: function() {
        var view = new Traverse.Views.ProfileShow({model: user});
        this._swapView(this.$mainview, this._mainview, view);
      }.bind(this)
    });
  },

  overlappingTrips: function(tripId) {
    var users = new Traverse.Collections.Users();
    users.fetch({
      data: { id: tripId },
      processData: true
    });
    var view = new Traverse.Views.SearchResults({collection: users});
    this._swapView(this.$mainview, this._mainview, view);
  },

  _swapView: function(pageElement, viewToReplace, currentView ) {
    viewToReplace && viewToReplace.remove();
    viewToReplace = currentView;
    pageElement.html(currentView.render().$el);
  }

});
