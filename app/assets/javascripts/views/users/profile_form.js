Traverse.Views.ProfileEdit = Backbone.CompositeView.extend({
  template: JST['user_profiles/form'],

  events: {
    'click #save-profile': 'saveProfile'
  },

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  onRender: function () {
    $("#hometown").geocomplete({
      details: "#edit-profile-form",
      detailsAttribute: "geodata"
    });
  },

  render: function () {
    var content = this.template({
        user: this.model
      });
    this.$el.html(content);
    this.onRender();
    return this;
  },

  saveProfile: function() {
    var dataHash = $('#edit-profile-form').serializeJSON();
    this.model.save(dataHash, {
      success: function() {
        Backbone.history.navigate("/profile/" + this.model.get("id"), {trigger: true});
      }.bind(this),
    });
  }
});
