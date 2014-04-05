ClientIndexRoute = Ember.Route.extend
  afterModel: ->
    @transitionTo 'tasks'


`export default ClientIndexRoute`
