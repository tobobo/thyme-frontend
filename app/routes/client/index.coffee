ClientIndexRoute = Ember.Route.extend
  beforeModel: ->
    @transitionTo 'tasks'


`export default ClientIndexRoute`
