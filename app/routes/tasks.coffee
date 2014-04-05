TasksRoute = Ember.Route.extend
  model: ->
    @modelFor('client').getTasks()

  afterModel: (model) ->
    model.set 'client', @modelFor('client')

`export default TasksRoute`
