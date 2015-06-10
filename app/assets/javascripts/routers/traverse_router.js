Traverse.Routers.Router = Backbone.Router.extend({

  routes: {
    '': 'tripIndex',
    'profile/edit(/)': 'editProfile',
    'profile/:id(/)': 'showProfile'
  },

  initialize: function(options) {
    this.$mainview = options.$mainview;
    this.$sideview = options.$sideview;
  },

  tripIndex: function() {

  },

  editProfile: function() {
    var view = new Traverse.Views.ProfileEdit();
    this._swapView(this.$mainview, this._mainview, view);
  },

  showProfile: function(id) {
    var view = new Traverse.Views.ProfileShow({
      userData: Traverse.userData,
      myProfile: Traverse.myProfile
    });
    this._swapView(this.$mainview, this._mainview, view);
  },

  _swapView: function(pageElement, viewToReplace, currentView ) {
    viewToReplace && viewToReplace.remove();
    viewToReplace = currentView;
    pageElement.html(currentView.render().$el);
  }


});
