Traverse.Views.TripView = Backbone.CompositeView.extend({

  template: JST['trips/show'],

  className: 'trip trip-view',

  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function() {
    var content = this.template({ trip: this.model });
    this.$el.html(content);
    return this;
  }
});
