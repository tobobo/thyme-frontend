ClientIndexRoute = Ember.Route.extend
  model: ->
    @modelFor 'client'
  beforeModel: (transition) ->
    @replaceWith 'tasks'


`export default ClientIndexRoute`
