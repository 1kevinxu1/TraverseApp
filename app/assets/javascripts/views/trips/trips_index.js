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
    this.$flashview = $('#flashview');
    // this.flashTrip
  },

  render: function() {
    var content = this.template({ });
    this.$el.html(content);
    this.attachSubviews();
    // this.flashTrip(this.collection.first());
    $('.content-header').html($("<h3>").text("Your Trips"));
    return this;
  },

  addTripView: function(trip) {
    var subview = new Traverse.Views.TripIndexItem({ model: trip });
    this.addSubview('#trips', subview);
  },

  flashTrip: function (trip) {
    trip.fetch({
      success: function() {
        var flashview = new Traverse.Views.TripFlashView({
          model: trip
        });
        this.swapFlash(flashview);
      }.bind(this)
    });
  },

  removeTripView: function(trip) {
    this.removeModelSubview('#trips', trip);
  },

  showForm: function(event) {
    $(event.currentTarget).remove();
    this.model = new Traverse.Models.Trip();
    var view = new Traverse.Views.TripForm({ model: this.model});
    this.$("#indexview").prepend(view.render().$el);
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
  },

  swapFlash: function(currentView) {
    this._flashview && this._flashview.remove();
    this._flashview = currentView;
    this.$flashview.html(currentView.render().$el);
  }
});
