ClientsNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'client'

  afterModel: (model) ->
    model.one 'didSave', =>
      @transitionTo 'client', model

`export default ClientsNewRoute`
