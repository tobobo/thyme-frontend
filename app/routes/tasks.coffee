TasksRoute = Ember.Route.extend
  model: ->
    @store.find 'task',
      clientId: @modelFor('client').get('id')

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'client', @modelFor('client')

`export default TasksRoute`
