Traverse.Views.ProfileShow = Backbone.CompositeView.extend({
  template: JST['profiles/show'],

  initialize: function(options) {
    debugger;
    this.userData = options.userData,
    this.myProfile = options.myProfile
  },

  render: function () {
    var content = this.template({
        userData: Traverse.userData,
        profile: Traverse.myProfile
      });
    this.$el.html(content);
    return this;
  },
});
