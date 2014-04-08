TasksIndexRoute = Ember.Route.extend
  model: ->
    @modelFor('tasks')

  afterModel: (model) ->
    currentTimer = Ember.get('App.applicationController.currentTimer')
    if currentTimer? and currentTimer.get('task.client.id') == @modelFor('client').get('id')
      @transitionTo 'task', currentTimer.get('task')
    else
      firstTask = model.get('firstObject')
      if firstTask? then @transitionTo 'task', firstTask
    true

`export default TasksIndexRoute`
