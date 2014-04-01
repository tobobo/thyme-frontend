var Router = Ember.Router.extend({location: 'history'})

Router.map(function() {
  this.route('/');
  this.resource('clients', {path: '/clients/'}, function() {
    this.route('new');
  });
});

export default Router;
