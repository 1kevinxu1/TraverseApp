Traverse.Views.ProfileShow = Backbone.CompositeView.extend({
  template: JST['profiles/show'],

  className: "profile-all group",

  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function () {
    var content = this.template({
        user: this.model
      });
    this.$el.html(content);
    return this;
  },

});
