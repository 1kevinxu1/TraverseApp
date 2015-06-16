Traverse.Views.TripIndexItem = Backbone.CompositeView.extend({

  template: JST['trips/index/indexview/index_item'],

  className: 'trip trips-index-item',

  events: {
    'click .search-users': 'userSearch'
  },

  render: function() {
    var content = this.template({ trip: this.model });
    this.$el.html(content);
    return this;
  }
});
