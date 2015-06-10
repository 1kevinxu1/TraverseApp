Traverse.Views.ProfileEdit = Backbone.CompositeView.extend({
  template: JST['profiles/form'],

  events: {
    'click #save-profile': 'saveProfile'
  },

  initialize: function() {
    this.myProfile = new Traverse.Models.Profile(Traverse.userData.id);
    this.myProfile.fetch();
  }

  render: function () {
    var content = this.template({
        profile: this.myProfile
      });
    this.$el.html(content);
    return this;
  },

  saveProfile: function() {
    var dataHash = $('.edit-profile-form').serializeJSON();
    Traverse.myProfile.set(dataHash);
    Traverse.myProfile.save([], {
      success: function() {
        Backbone.history.navigate("/profile", {trigger: true});
      },
      error: function(model, response) {
        response.responseJSON.forEach(function(response){
          alert(response);
        });
      }
    });
  }
});
