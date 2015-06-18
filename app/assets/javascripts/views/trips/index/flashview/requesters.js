Traverse.Views.RequesterFlashView = Backbone.CompositeView.extend({
  template: JST['trips/index/flashview/requesters'],

  events: {
    'click .response': 'handleRequest'
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

  handleRequest: function (event) {
    var request = new Traverse.Models.MeetRequest(this.model.get("request"));
    var status = $(event.currentTarget).data("response");
    request.save({status: status});
    if (status === "ACCEPTED") {
      this.meeters.add(this.model);
    }
    this.collection.shift();
  }
});
