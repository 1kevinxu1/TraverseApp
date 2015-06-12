Traverse.Views.SharedTrip = Backbone.CompositeView.extend({

  template: JST['trips/shared_trip'],

  className: 'trip trip-view',

  events: {
    'click .submit-request': 'submitRequest'
  },

  initialize: function (options) {
    this.request = new Traverse.Models.MeetRequest(this.model.get("request"));
  },

  render: function() {
    var content = this.template({ trip: this.model });
    this.$el.html(content);
    var sharedTripButton = new Traverse.Views.SharedTripButton({
      model: this.request
    });
    this.$('.trip-information-header').append(sharedTripButton.render().$el);
    return this;
  },

  submitRequest: function () {
    this.request.save({requested_trip_id: this.model.get("trip_id"), status: 'PENDING'});
  }

});

Traverse.Views.SharedTripButton = Backbone.View.extend({
  className: 'btn pull-right',

  initialize: function () {
    this.listenTo(this.model, "sync", this.render)
  },

  render: function() {
    this.$el.removeClass("btn-primary submit-request");
    var status = this.model.get("status");
    if (status === 'PENDING') {
      this.$el.html("Request Sent.");
    } else if (status === 'DECLINED') {
      this.$el.addClass("btn-danger").html("Request Declined.");
    } else if (status === 'ACCEPTED') {
      this.$el.addClass("btn-success").html("Request Accepted!")
    } else {
      this.$el.addClass("btn-primary submit-request").html("Let's Meet!")
    }
    return this;
  },

});
