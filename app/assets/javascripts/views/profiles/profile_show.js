Traverse.Views.ProfileShow = Backbone.CompositeView.extend({
  template: JST['profiles/show'],

  events: {
    'click .sign-out-button': 'signOut',
    'click .profile': 'profile'
  },

  initialize: function(options) {
  },

  render: function () {
    debugger;
    var content = this.template({
      userData: Traverse.userData,
      profile: Traverse.myProfile
      })
    this.$el.html(content);
    return this;
  },

  signOut: function(event) {
    $('form.sign-out-form').submit();
  },

  profile: function() {
    Backbone.history.navigate("/profile", {trigger: true})
  }

});
