Traverse.Models.User = Backbone.Model.extend({
  urlRoot: "api/users",

  sharedTrips: function() {
    this._trips =
      this._trips || new Traverse.Collections.Trips([], { user: this });
    return this._trips;
  },

  request: function() {
    this._request =
      this._request || new Traverse.Models.MeetRequest({user: this});
    return this._request;
  },

  parse: function(response) {
    if (response.shared_trips) {
      debugger;
      this.sharedTrips().set(response.shared_trips);
      delete response.shared_trips;
    } else if (response.request) {
      this.request().set(response.request);
    }
    debugger;

    return response;
  }
});
