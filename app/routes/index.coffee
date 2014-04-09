IndexRoute = Ember.Route.extend
  beforeModel: ->
    @transitionTo 'clients'

`export default IndexRoute`
