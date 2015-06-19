Traverse.Views.ProfileSidebar = Backbone.CompositeView.extend({
  template: JST['user_profiles/sidebar'],

  events: {
    "click #upload-photo-button": "upload"
  },

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function () {
    var content = this.template({ user: this.model });
    this.$el.html(content);
    this.onRender();
    return this;
  },

  onRender: function () {
    $("#myTags").tagit({
      removeConfirmation: true,
      allowSpaces: true,
      placeholderText: "Add New Interest"
    });
  },

  upload: function (arguments) {
    var that = this;
    cloudinary.openUploadWidget(CLOUDINARY_OPTIONS, function(error, result) {
      var baseURL = "http://res.cloudinary.com/traverse/image/upload/";
      var cropCoords = result[0].coordinates.custom[0];
      var cropString =
        "x_" + cropCoords[0] +
        ",y_" + cropCoords[1] +
        ",w_" + cropCoords[2] +
        ",h_" + cropCoords[3] +
        ",c_crop/";
      var path = result[0].path;
      that.model.save({ image_url: baseURL + cropString + path }, {
        success: function() {
          that.render();
        }.bind(that)
      });
    });
  }
});
