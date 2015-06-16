var Traverse = window.Traverse = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var header = new Traverse.Views.Header();
    $('#header').html(header.render().$el);
    var $mainview = $('#mainview');
    var $sideview = $('#sideview');
    this.router = new Traverse.Routers.Router({
      $mainview: $mainview,
      $sideview: $sideview,
    });
    Backbone.history.start();
  }
};
