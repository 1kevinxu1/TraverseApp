Traverse.Routers.Router = Backbone.Router.extend({

  routes: {
    '': 'tripIndex',
    'profile(/)': 'myProfile',
    'profile/:id(/)': 'showProfile'
  },

  initialize: function(options) {
    this.$mainview = options.$mainview;
    this.$sideview = options.$sideview;
  },

  tripIndex: function() {

  },

  myProfile: function() {
    var view = new Traverse.Views.ProfileShow({});
    this._swapView(this.$mainview, this._mainview, view);
  },

  showProfile: function(id) {

  },

  _swapView: function(pageElement, viewToReplace, currentView ) {
    viewToReplace && viewToReplace.remove();
    viewToReplace = currentView;
    pageElement.html(currentView.render().$el);
  }


});
