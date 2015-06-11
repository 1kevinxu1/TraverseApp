Traverse.Views.TripForm = Backbone.CompositeView.extend({

  template: JST['trips/show'],

  className: 'trip trip-view',

  events: {
    'click submit-trip': 'submitTrip'
  },

  render: function() {
    var content = this.template({ trip: this.model });
    this.$el.html(content);
    return this;
  },

  submitTrip: function() {
    var data = this.$el.serializeJSON();
    this.model.save(data, {
      success: function() {
        this.collection.add(this.model)
      }.bind(this),
      error: function(model, response) {
        
      }.bind(this),
    });
  }

});
