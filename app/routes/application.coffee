ApplicationRoute = Ember.Route.extend
  setupController: (controller, model) ->
   Ember.set 'App.applicationController', controller

`export default ApplicationRoute`
