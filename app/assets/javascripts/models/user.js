Traverse.Models.User = Backbone.Model.extend({
  urlRoot: "api/users",

  sharedTrips: function() {
    this._trips =
      this._trips || new Traverse.Collections.Trips([], { user: this });
    return this._trips;
  },

  parse: function(response) {
    if (response.shared_trips) {
      this.sharedTrips().set(response.shared_trips);
      delete response.shared_trips;
    }
    return response;
  }
});
