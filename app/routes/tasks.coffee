TasksRoute = Ember.Route.extend
  model: ->
    @modelFor('client').getTasks()

  afterModel: (model) ->
    @modelFor('client').set 'tasks', model
    model.set 'client', @modelFor('client')

`export default TasksRoute`
