Traverse.Views.TripsIndex = Backbone.CompositeView.extend({

  template: JST['trips/index'],

  events: {
    'submit form#trip-form': 'submitTrip',
    'click .trips-index-item': 'selectTrip',
  },

  initialize: function() {
    this.listenTo(this.collection, "add", this.addTripView);
    this.listenTo(this.collection, "remove", this.removeTripView);
    this.collection.each(this.addTripView.bind(this));
  },

  addTripView: function(trip) {
    var subview = new Traverse.Views.TripIndexItem({ model: trip });
    this.addSubview('#trips-index', subview);

    if (!this.currentTrip) {
      this.currentTrip = trip;
      this.flashTrip();
    }
  },

  flashTrip: function () {
    this.$flashview = this.$('#flashview');
    var trip = this.currentTrip || new Traverse.Models.Trip();
    trip.fetch({
      success: function() {
        var flashview = new Traverse.Views.TripFlashView({
          model: trip
        });
        this.swapFlash(flashview);
      }.bind(this)
    });
  },

  onRender: function () {
    $("#destination").geocomplete({
      details: "#trip-form",
      detailsAttribute: "geodata"
    });
  },

  removeTripView: function(trip) {
    this.removeModelSubview('#trips-index', trip);
    if (trip === this.currentTrip) {
      this.currentTrip = this.collection.first();
    }
    this.render();
  },

  render: function() {
    var content = this.template({ });
    this.$el.html(content);
    this.attachSubviews();
    this.flashTrip();
    this.onRender();
    return this;
  },

  selectTrip: function (event) {
    this.currentTrip = this.collection.models[$(event.currentTarget).index()];
    this.render();
  },

  showForm: function(event) {
    $(event.currentTarget).remove();
    this.model = new Traverse.Models.Trip();
    var view = new Traverse.Views.TripForm({ model: this.model});
    this.$("#indexview").prepend(view.render().$el);
  },

  sortTrips: function () {
    this._subviews['#trips-index'] = _([]);
    this.collection.comparator = "start_date";
    this.collection.sort();
    this.collection.each(this.addTripView.bind(this));
    this.render();
  },

  submitTrip: function(event) {
    event.preventDefault();
    var data = $(event.currentTarget).serializeJSON();
    var newTrip = new Traverse.Models.Trip().set(data.trip);
    newTrip.save({}, {
      success: function(model, response) {
        this.collection.add(model);
        this.sortTrips();
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
