Traverse.Views.TripView = Backbone.CompositeView.extend({

  template: JST['trips/show'],

  className: 'trip trip-view',

  render: function() {
    debugger;
    var content = this.template({ trip: this.model });
    this.$el.html(content);
    return this;
  }

});
