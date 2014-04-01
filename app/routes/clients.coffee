ClientsRoute = Ember.Route.extend
  model: ->
    @store.find('client')

`export default ClientsRoute`
