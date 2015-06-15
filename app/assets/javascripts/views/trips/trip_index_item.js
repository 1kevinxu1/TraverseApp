Traverse.Views.TripIndexItem = Backbone.CompositeView.extend({

  template: JST['trips/index_item'],

  className: 'trip trip-view',

  events: {
    'click .search-users': "userSearch"
  },

  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function() {
    var content = this.template({ trip: this.model });
    this.$el.html(content);
    return this;
  }
});
