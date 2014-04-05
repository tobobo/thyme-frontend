TasksRoute = Ember.Route.extend
  model: ->
    @modelFor('client').getTasks()

`export default TasksRoute`
