Traverse.Views.TripIndexItem = Backbone.CompositeView.extend({

  template: JST['trips/index/indexview/index_item'],

  className: 'mypanel trips-index-item',

  render: function() {
    var content = this.template({ trip: this.model });
    this.$el.html(content);
    return this;
  }
});
