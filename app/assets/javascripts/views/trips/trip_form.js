Traverse.Views.TripForm = Backbone.CompositeView.extend({

  template: JST['trips/form'],

  className: 'trip trip-view',

  render: function() {
    var content = this.template({ trip: this.model });
    this.$el.html(content);
    return this;
  }

});
