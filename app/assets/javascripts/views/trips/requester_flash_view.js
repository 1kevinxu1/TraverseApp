Traverse.Views.RequesterFlashView = Backbone.CompositeView.extend({
  template: JST['trips/requester_flash_view'],

  events: {
    'click #accept': 'acceptRequest',
    'click #decline': 'declineRequest'
  },

  initialize: function () {
    this.listenTo(this.collection, "sync remove add", this.render);
  },

  render: function () {
    this.model = this.collection.first() || false;
    var content = this.template({ user: this.model });
    this.$el.html(content);
    return this;
  },

  acceptRequest: function (event) {
    var request = new Traverse.Models.MeetRequest(this.model.get("request"));
    request.save({status:"ACCEPTED"});
    this.collection.shift();
  }
});
