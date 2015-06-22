Traverse.Models.User = Backbone.Model.extend({
  urlRoot: "api/users",

  sharedTrips: function() {
    this._trips =
      this._trips || new Traverse.Collections.Trips([], { user: this });

    return this._trips;
  },

  userInterests: function() {
    this._userInterests =
      this._userInterests || new Traverse.Collections.UserInterests([], { user: this });
    return this._userInterests;
  },

  friends: function () {
    this._friends =
      this._friends || new Traverse.Collections.Users([], { user: this })
    return this._friends;
  },

  parse: function(response) {
    if (response.shared_trips) {
      this.sharedTrips().set(response.shared_trips);
      delete response.shared_trips;
    }
    if (response.user_interests) {
      this.userInterests().set(response.user_interests);
      delete response.interests;
    }
    if (response.friends) {
      this.friends().set(response.friends);
      delete response.friends;
    }
    return response;
  }
});
