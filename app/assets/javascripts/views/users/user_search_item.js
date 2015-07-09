Traverse.Views.UserSearchItem = Backbone.CompositeView.extend({

  template: JST['users/search_item'],

  className: 'mypanel users-index-item',

  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function() {
    var content = this.template({ user: this.model });
    this.$el.html(content);
    this.onRender();
    return this;
  }
});
