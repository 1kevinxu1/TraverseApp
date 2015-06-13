Traverse.Views.RequesterFlashView = Backbone.CompositeView.extend({
  template: JST['trips/requester_flash_view'],

  events: {
    'click #accept': 'acceptRequest',
    'click #decline': 'declineRequest'
  },

  render: function () {
    var content = this.template({ user: this.model });
    this.$el.html(content);
    return this;
  },

  acceptRequest: function (event) {
  }
});
