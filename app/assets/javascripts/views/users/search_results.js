Traverse.Views.SearchResults = Backbone.CompositeView.extend({

  template: JST['users/search_results'],

  events: {
  },

  initialize: function() {
    this.listenTo(this.collection, "add", this.addTripView);
    this.listenTo(this.collection, "remove", this.removeTripView);
    this.collection.each(this.addTripView.bind(this));
  },

  render: function() {
    var content = this.template({});
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addTripView: function(user) {
    var subview = new Traverse.Views.UserView({ model: user });
    this.addSubview('#users', subview);
  },

  removeTripView: function(user) {
    this.removeModelSubview('#users', user);
  }
});
