Traverse.Models.Trip = Backbone.Model.extend({
  urlRoot: "/api/trips",

  requesters: function() {
    this._requesters =
      this._requesters || new Traverse.Collections.Users([], { trip: this });
    return this._requesters;
  },

  meeters: function() {
    this._meeters =
      this._meeters || new Traverse.Collections.Users([], { trip: this });
    return this._meeters;
  },

  parse: function(response) {
    if (response.pending_requests) {
      this.requesters().set(response.pending_requests);
      delete response.pending_requests;
    }
    if (response.accepted_requests) {
      this.meeters().set(response.accepted_requests);
      delete response.accepted_requests;
    }
    this.meetings = 0;
    return response;
  }
});
