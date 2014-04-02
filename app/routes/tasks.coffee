TasksRoute = Ember.Route.extend
  model: ->
    @store.find 'task',
      clientId: @modelFor('client').get('id')

  afterModel: (model) ->
    model.set 'client', @modelFor('client')
    model.setEach 'client', @modelFor('client')

`export default TasksRoute`
