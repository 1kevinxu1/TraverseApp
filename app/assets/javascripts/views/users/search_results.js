Traverse.Views.SearchResults = Backbone.CompositeView.extend({

  template: JST['users/search_results'],

  initialize: function() {
    this.listenTo(this.collection, "add", this.addTripView);
    this.listenTo(this.collection, "remove", this.removeTripView);
    this.collection.each(this.addTripView.bind(this));
  },

  addTripView: function(user) {
    var subview = new Traverse.Views.UserSearchItem({ model: user });
    this.addSubview('#users', subview);
  },

  removeTripView: function(user) {
    this.removeModelSubview('#users', user);
  },

  render: function() {
    var content = this.template({});
    this.$el.html(content);
    this.attachSubviews();
    return this;
  }
});
