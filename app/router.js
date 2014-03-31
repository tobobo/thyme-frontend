var Router = Ember.Router.extend({location: 'history'})

Router.map(function() {
  this.resource('clients', function() {
    this.route('new');
  });
});

export default Router;
