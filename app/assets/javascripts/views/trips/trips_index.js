Traverse.Views.TripsIndex = Backbone.CompositeView.extend({

  template: JST['trips/index'],

  initialize: function() {
    this.listenTo(this.collection, "add", this.addTripView);
    this.listenTo(this.collection, "remove", this.removeTripView);
    this.collection.each(this.addTripView.bind(this));
  },

  render: function() {
    var content = this.template({ });
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addTripView: function(trip) {
    debugger;
    var subview = new Traverse.Views.TripView({ model: trip });
    this.addSubview('#trips', subview);
  },

  removeTripView: function(trip) {
    this.removeModelSubview('#trips', trip);
  }

});
