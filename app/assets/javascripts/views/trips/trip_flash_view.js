Traverse.Views.TripFlashView = Backbone.CompositeView.extend({
  template: JST['trips/flash_view'],

  events: {
    'click #accept': 'acceptRequest',
    'click #decline': 'declineRequest'
  },

  initialize: function() {
    this.requests = this.model.requesters();
    debugger;
  },

  render: function () {
    var content = this.template({
      trip: this.model
    });
    this.$el.html(content);
    var requesterView = new Traverse.Views.RequesterFlashView({model: this.requests.first()});
    this.$el.append(requesterView.render().el)
    return this;
  },

  acceptRequest: function (event) {
  }
});
