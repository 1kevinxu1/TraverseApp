Traverse.Views.Header = Backbone.View.extend({
  template: JST['header'],

  events: {
    'click .sign-out-button': 'signOut',
    'click .profile-button': 'profile',
    'click .navbar-brand': 'index'
  },

  render: function () {
    var content = this.template({ });
    this.$el.html(content);
    $.getJSON('api/users/names', function(names){
      $('#searchbar').autocomplete({
        source: function(request, response) {
          var results = $.ui.autocomplete.filter(names, request.term);
          // return 6 results at most
          response(results.slice(0, 6));
        },
        minLength: 1,
        select: function (event, ui) {
          var userId = ui.item.id;
          Backbone.history.navigate('#profile/' + userId, {trigger: true});
          $(this).val('');
          return false;
        }
      });
    });
    return this;
  },

  signOut: function(event) {
    $('form.sign-out-form').submit();
  },

  profile: function() {
    Backbone.history.navigate("/profile/" + Traverse.userId, {trigger: true});
  },

  index: function() {
    Backbone.history.navigate("", {trigger: true})
  }

});
