ApplicationRoute = Ember.Route.extend
  model: ->
    @store.find 'timer',
      running: true
    .then (timers) =>
      Ember.RSVP.resolve timers.get('firstObject')

  afterModel: (model) ->
    if model?
      theTask = null
      @store.find 'task', model.get('taskId')
      .then (task) =>
        task.getTimers()
      .then (task) =>
        theTask = task
        model.set 'task', theTask
        @store.find 'client', task.get('clientId')
      .then (client) =>
        theTask.set 'client', client
        Ember.RSVP.resolve model

  setupController: (controller, model) ->
    @set 'common.currentTimer', model

`export default ApplicationRoute`
