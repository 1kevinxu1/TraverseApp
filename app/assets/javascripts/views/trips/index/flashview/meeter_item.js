Traverse.Views.MeeterView = Backbone.CompositeView.extend({
  template: JST['trips/index/flashview/meeter_item'],

  initialize: function () {
  },

  render: function () {
    var content = this.template({ user: this.model });
    this.$el.html(content);
    return this;
  },

});
