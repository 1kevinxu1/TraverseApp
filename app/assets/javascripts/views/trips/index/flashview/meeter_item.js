Traverse.Views.MeeterView = Backbone.CompositeView.extend({
  template: JST['trips/index/flashview/meeter_item'],

  // events: {
  //   'click #accept': 'acceptRequest',
  //   'click #decline': 'declineRequest'
  // },

  initialize: function () {
  },

  render: function () {
    debugger;
    var content = this.template({ user: this.model });
    this.$el.html(content);
    return this;
  },
  //
  // acceptRequest: function (event) {
  //   var request = new Traverse.Models.MeetRequest(this.model.get("request"));
  //   request.save({status:"ACCEPTED"});
  //   this.collection.shift();
  // }
});
