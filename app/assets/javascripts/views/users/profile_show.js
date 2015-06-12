Traverse.Views.ProfileShow = Backbone.CompositeView.extend({
  template: JST['user_profiles/show'],

  className: "profile-all group",

  initialize: function() {
    this.collection = this.model.sharedTrips();
    this.listenTo(this.collection, "add", this.addSharedTrip)
    this.listenTo(this.collection, "remove", this.removeSharedTrip)
    this.collection.each(this.addSharedTrip);
  },

  render: function () {
    debugger;
    var content = this.template({
        user: this.model
      });
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addSharedTrip: function(sharedTrip) {
    var subview = new Traverse.Views.SharedTrip({model: sharedTrip});
    this.addSubview('.overlapping_trips', subview);
  },

  removeSharedTrip: function(sharedTrip) {
    this.removeModelSubview('.overlapping_trips', sharedTrip);
  }

});
