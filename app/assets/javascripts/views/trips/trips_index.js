Traverse.Views.TripsIndex = Backbone.CompositeView.extend({

  template: JST['trips/index'],

  events: {
    'click .trip-new': 'showForm',
    'submit form.trip-details': 'submitTrip'
  },

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
    var subview = new Traverse.Views.TripView({ model: trip });
    this.addSubview('#trips', subview);
  },

  removeTripView: function(trip) {
    this.removeModelSubview('#trips', trip);
  },

  showForm: function(event) {
    $(event.currentTarget).remove();
    this.model = new Traverse.Models.Trip();
    var view = new Traverse.Views.TripForm({ model: this.model});
    this.$el.append(view.render().$el);
  },

  submitTrip: function(event) {
    event.preventDefault();
    var data = $(event.currentTarget).serializeJSON();
    this.model.save(data, {
      success: function(model, response) {
        this.collection.add(model);
        this.render();
      }.bind(this),
      error: function(model, response) {
      }.bind(this),
    });
  }
});
