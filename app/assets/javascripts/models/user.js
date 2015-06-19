Traverse.Models.User = Backbone.Model.extend({
  urlRoot: "api/users",

  sharedTrips: function() {
    this._trips =
      this._trips || new Traverse.Collections.Trips([], { user: this });

    return this._trips;
  },

  userInterests: function() {
    this._user_interests =
      this._user_interests || new Traverse.Collections.UserInterests({ user: this });

    return this._user_interests;
  },

  parse: function(response) {
    if (response.shared_trips) {
      this.sharedTrips().set(response.shared_trips);
      delete response.shared_trips;
    }
    if (response.user_interests) {
      this.userInterests().set(response.user_interests);
      delete response.interests
    }

    return response;
  }
});
