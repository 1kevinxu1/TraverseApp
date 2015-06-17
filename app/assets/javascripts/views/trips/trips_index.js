Traverse.Views.TripsIndex = Backbone.CompositeView.extend({

  template: JST['trips/index'],

  events: {
    'submit form#trip-form': 'submitTrip',
    'click .trips-index-item': 'selectTrip'
  },

  initialize: function() {
    this.listenTo(this.collection, "add", this.addTripView);
    this.listenTo(this.collection, "remove", this.removeTripView);
    this.collection.each(this.addTripView.bind(this));
    this.currentTrip = this.collection.first();
  },

  render: function() {
    var content = this.template({ });
    this.$el.html(content);
    this.attachSubviews();
    this.flashTrip();
    $('.content-header').html($("<h3>").text("Your Trips"));
    return this;
  },

  addTripView: function(trip) {
    var subview = new Traverse.Views.TripIndexItem({ model: trip });
    this.addSubview('#trips-index', subview);
  },

  selectTrip: function (event) {
    this.currentTrip = this.collection.models[$(event.currentTarget).index()];
    this.render();
  },

  flashTrip: function () {
    this.$flashview = this.$('#flashview');
    var trip = this.currentTrip;
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
    this.removeModelSubview('#trips-index', trip);
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
    debugger;
    new Traverse.Models.Trip().save(data, {
      success: function(model, response) {
        this.collection.add(model);
        this.render();
      }.bind(this),
      error: function(model, response) {
        var errors = $('#form-errors');
        errors.empty();
        response.responseJSON.forEach(function(error) {
          $('#form-errors').append(error).append("<br>");
        });
      }.bind(this),
    });
  },

  swapFlash: function(currentView) {
    this._flashview && this._flashview.remove();
    this._flashview = currentView;
    this.$flashview.html(currentView.render().$el);
  }
});
