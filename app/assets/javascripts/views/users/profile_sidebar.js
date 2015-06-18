Traverse.Views.ProfileSidebar = Backbone.CompositeView.extend({
  template: JST['user_profiles/sidebar'],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function () {
    var content = this.template({ user: this.model });
    this.$el.html(content);
    return this;
  }
});
