Traverse.Views.TripFlashView = Backbone.CompositeView.extend({
  template: JST['trips/index/flashview/flash_view'],

  initialize: function() {
    this.requesters = this.model.requesters();
    this.meeters = this.model.meeters();
    this.addRequesterFlashView();
    this.meeters.each(this.addUserMeetingView.bind(this));
    this.listenTo(this.meeters, "add", this.addUserMeetingView);
  },

  render: function () {
    var content = this.template({
      trip: this.model
    });
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addRequesterFlashView: function () {
    var requesterView = new Traverse.Views.RequesterFlashView({
      collection: this.requesters,
      meeters: this.meeters
    });
    this.addSubview('#pending-requests', requesterView);
  },

  addUserMeetingView: function (meeter) {
    var meeterView = new Traverse.Views.MeeterView({
      model: meeter
    });
    this.addSubview('#user-meeters', meeterView);
  }

});
