Traverse.Views.TripForm = Backbone.CompositeView.extend({

  template: JST['trips/index/indexview/form'],

  render: function() {
    var content = this.template({ trip: this.model });
    this.$el.html(content);
    return this;
  }

});
