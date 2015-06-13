Traverse.Models.Trip = Backbone.Model.extend({
  urlRoot: "/api/trips",

  requesters: function() {
    this._requesters =
      this._requesters || new Traverse.Collections.Users([], { trip: this });
    return this._requesters;
  },

  parse: function(response) {
    if (response.requests) {
      this.requesters().set(response.requests);
      delete response.requests;
    }
    return response;
  }
});
