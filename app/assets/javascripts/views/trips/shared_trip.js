Traverse.Views.SharedTrip = Backbone.CompositeView.extend({

  template: JST['trips/shared_trip'],

  className: 'trip trip-view',

  events: {
    'click #request-button': 'requestMeet'
  },

  render: function() {
    var content = this.template({ trip: this.model });
    this.$el.html(content);
    var sharedTripButton = new Traverse.Views.SharedTripButton({request: this.model.get("request")});
    this.$('.trip-information-header').append(sharedTripButton.render().$el);
    return this;
  }
  // },
  //
  // requestMeet: function() {
  //   var request = new Traverse.Models.MeetRequest({trip_id: this.model.trip_id});
  //   request.save({}, function(){
  //     success: function() {
  //     }
  //   });
  // }
});

Traverse.Views.SharedTripButton = Backbone.View.extend({
  className: 'btn pull-right',

  initialize: function(options) {
    this.request = options.request;
  },

  render: function() {
    debugger;
    var status = this.request.status;
    if (status === 'PENDING') {
      this.$el.html("Request Sent.");
    } else if (status === 'DECLINED') {
      this.$el.addClass("btn-danger").html("Request Declined.");
    } else if (status === 'ACCEPTED') {
      this.$el.addClass("btn-success").html("Request Accepted!")
    } else {
      this.$el.addClass("btn-primary").html("Let's Meet!")
    }

    return this;
  }

});
