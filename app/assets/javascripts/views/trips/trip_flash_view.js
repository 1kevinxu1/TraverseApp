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
    debugger;
    var content = this.template({
        user: this.requests.first()
      });
    this.$el.html(content);
    return this;
  },

  acceptRequest: function (event) {}

  
});
