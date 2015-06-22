Traverse.Views.ProfileSidebar = Backbone.CompositeView.extend({
  template: JST['user_profiles/sidebar'],

  events: {
    "click #upload-photo-button": "upload"
  },

  initialize: function () {
    this.friendsNum = 0;
    this.friends = this.model.friends();
    this.listenTo(this.friends, "add", this.addFriendView);
    this.listenTo(this.model, "sync", this.render);
    this.model.friends().each(this.addFriendView.bind(this));
  },
  
  addFriendView: function (friend) {
    var friendView = new Traverse.Views.MeeterView({
      model: friend
    });
    this.addSubview('#friends', friendView);
    this.friendsNum++;
    this.render();
  },

  onRender: function () {
    $("#myTags").tagit({
      removeConfirmation: true,
      allowSpaces: true,
      placeholderText: (this.model.id === Traverse.userId ? "Add New Interest" : ""),
      caseSensitive: false,
      readOnly: this.model.id !== Traverse.userId,
      afterTagAdded: function(event, ui) {
        if (!_.contains(this.interestTags, ui.tagLabel)) {
          var interest = new Traverse.Models.UserInterest();
          interest.save({ name: ui.tagLabel });
          this.model.userInterests().add(interest)
        }
      }.bind(this),
      beforeTagRemoved: function (event, ui) {
        var interest = this.model.userInterests().models[ui.tag.index()];
        this.model.userInterests().remove(interest);
        interest.destroy();
      }.bind(this),
    });
  },

  render: function () {
    var content = this.template({
      user: this.model,
      friendsNum: this.friendsNum
    });
    this.$el.html(content);
    this.attachSubviews();
    this.setInterestTags();
    this.onRender();
    return this;
  },

  setInterestTags: function () {
    this.interestTags = [];
    this.model.userInterests().each(function(interest) {
      this.interestTags.push(interest.get("name"));
    }.bind(this));
  },

  upload: function () {
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
        }
      });
    });
  }
});
