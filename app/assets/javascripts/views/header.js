Traverse.Views.Header = Backbone.CompositeView.extend({
  template: JST['header'],

  render: function () {
    var content = this.template({name: Traverse.CURRENT_USER_NAME})
    this.$el.html(content);
    return this;
  }
});
