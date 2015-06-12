Traverse.Models.User = Backbone.Model.extend({
  urlRoot: "api/users",

  sharedTrips: function() {
      this._trips =
        this._trips || new Traverse.Collections.Trips([], { user: this });
      return this._trips;
    },

  parse: function(response) {
    debugger;
    if (response.shared_trips) {
      this.trips().set(response.trips, {parse: true});
      delete response.lists;
    }
    return response;
  }
});
