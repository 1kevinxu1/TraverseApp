Traverse.Views.Header = Backbone.View.extend({
  template: JST['header'],

  events: {
    'click .sign-out-button': 'signOut',
    'click .profile': 'profile',
    'click .navbar-brand': 'index'
  },

  render: function () {
    var content = this.template({ });
    this.$el.html(content);
    return this;
  },

  signOut: function(event) {
    $('form.sign-out-form').submit();
  },

  profile: function() {
    Backbone.history.navigate("/profile", {trigger: true})
  },

  index: function() {
    Backbone.history.navigate("", {trigger: true})
  }

});
