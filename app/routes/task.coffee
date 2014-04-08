TaskRoute = Ember.Route.extend
  model: (params) ->
    model = null
    @store.find 'task',
      slug: params.taskSlug
      clientId: @modelFor('client').get('id')
    .then (tasks) =>
      Ember.RSVP.resolve tasks.get('firstObject')
    .then (task) =>
      model = task
      @store.find 'timer',
        taskId: model.get('id')
    .then (timers) =>
      timers.setEach 'task', model
      timers.setEach 'client', @modelFor('client')
      model.set 'timers', timers
      Ember.RSVP.resolve model

  afterModel: (model) ->
    model.set 'client', @modelFor('client')
    unless model.get('timers')?
      model.set 'timers', []

  serialize: (model) ->
    taskSlug: model.get('slug')

  currentTaskIndex: ->
    currentTaskIndex = -1
    @modelFor('tasks').find (item, index) =>
      if item.get('id') == @get('controller.model.id')
        currentTaskIndex = index
        true
    currentTaskIndex

  actions:
    nextTask: ->
      task = @modelFor('tasks').objectAt(@currentTaskIndex() + 1)
      if task? then @transitionTo 'task', task
      return

    previousTask: ->
      task = @modelFor('tasks').objectAt(@currentTaskIndex() - 1)
      if task? then @transitionTo 'task', task
      return

`export default TaskRoute`
