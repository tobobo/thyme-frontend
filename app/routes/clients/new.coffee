ClientsNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('client');

`export default ClientsNewRoute`
