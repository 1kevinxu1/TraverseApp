window.Traverse = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var header = new Traverse.Views.Header();
    $('#header').html(header.render().$el);

  }
};
