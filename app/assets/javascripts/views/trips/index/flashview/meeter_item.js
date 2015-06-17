Traverse.Views.MeeterView = Backbone.CompositeView.extend({
  template: JST['trips/index/flashview/meeter_item'],

  className: "meeter-item",

  initialize: function () {
  },

  render: function () {
    debugger;
    var content = this.template({ user: this.model });
    this.$el.html(content);
    return this;
  },

});
