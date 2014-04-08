TasksRoute = Ember.Route.extend
  model: ->
    @modelFor('client').get('tasks') or @modelFor('client').getTasks()

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'client', @modelFor('client')

`export default TasksRoute`
