Traverse.Views.TripFlashView = Backbone.CompositeView.extend({
  template: JST['trips/index/flashview/flash_view'],

  className: 'mypanel group',

  initialize: function(options) {
    this.model.meetings = 0;
    this.user = options.user
    this.requesters = this.model.requesters();
    this.meeters = this.model.meeters();
    this.addRequesterFlashView();
    this.meeters.each(this.addUserMeetingView.bind(this));
    this.listenTo(this.meeters, "add", this.addUserMeetingView);
  },

  addRequesterFlashView: function () {
    var requesterView = new Traverse.Views.RequesterFlashView({
      collection: this.requesters,
      meeters: this.meeters,
      user: this.user
    });
    this.addSubview('#pending-requests', requesterView);
  },

  addUserMeetingView: function (meeter) {
    var meeterView = new Traverse.Views.MeeterView({
      model: meeter
    });
    this.addSubview('#user-meeters', meeterView);
    this.model.meetings++;
    this.render();
  },

  render: function () {
    var content = this.template({
      trip: this.model
    });
    this.$el.html(content);
    this.attachSubviews();
    return this;
  }
});
