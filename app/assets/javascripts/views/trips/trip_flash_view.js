Traverse.Views.TripFlashView = Backbone.CompositeView.extend({
  template: JST['trips/flash_view'],

  // events: {
  //   'click #accept': 'acceptRequest',
  //   'click #decline': 'declineRequest'
  // },

  initialize: function() {
    this.requests = this.model.requesters();
  },

  render: function () {
    var content = this.template({
      trip: this.model
    });
    this.$el.html(content);
    var requesterView = new Traverse.Views.RequesterFlashView({
      collection: this.requests
    });
    this.$el.append(requesterView.render().$el)
    return this;
  }
  //
  // acceptRequest: function (event) {
  //   debugger;
  // }
});
