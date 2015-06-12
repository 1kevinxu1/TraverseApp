Traverse.Views.UserView = Backbone.CompositeView.extend({

  template: JST['users/view'],

  className: 'trip user-view',

  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function() {
    console.log(this.model);
    var content = this.template({ user: this.model });
    this.$el.html(content);
    return this;
  },

});
