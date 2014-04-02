TasksIndexRoute = Ember.Route.extend
  model: ->
    @modelFor('tasks')

  afterModel: (model) ->
    currentTimer = Ember.get('App.applicationController.currentTimer')
    if currentTimer? and currentTimer.get('client.id') == @modelFor('client').get('id')
      @transitionTo 'task', currentTimer.get('task')
    true

`export default TasksIndexRoute`
