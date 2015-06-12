Traverse.Views.SharedTrip = Backbone.CompositeView.extend({

  template: JST['trips/shared_trip'],

  className: 'trip trip-view',

  initialize: function() {
  },

  render: function() {
    var content = this.template({ trip: this.model });
    this.$el.html(content);
    return this;
  }
});
