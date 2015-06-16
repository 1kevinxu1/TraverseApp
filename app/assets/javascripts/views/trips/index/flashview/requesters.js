Traverse.Views.RequesterFlashView = Backbone.CompositeView.extend({
  template: JST['trips/index/flashview/requesters'],

  events: {
    'click #accept': 'acceptRequest',
    'click #decline': 'declineRequest'
  },

  initialize: function (options) {
    this.listenTo(this.collection, "sync remove add", this.render);
    this.meeters = options.meeters;
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
    this.meeters.add(this.model);
    this.collection.shift();
  }
});
