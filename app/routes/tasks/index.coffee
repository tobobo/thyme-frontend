TasksIndexRoute = Ember.Route.extend
  model: ->
    @modelFor('tasks')

  beforeModel: (transition) ->
    currentTimer = @get('common.currentTimer')
    if currentTimer? and currentTimer.get('task.client.id') == @modelFor('client').get('id')
      transition.then => @replaceWith 'task', currentTimer.get('task')
    else
      firstTask = @modelFor('tasks').get('firstObject')
      if firstTask? then transition.then => @replaceWith 'task', firstTask
    return


`export default TasksIndexRoute`
