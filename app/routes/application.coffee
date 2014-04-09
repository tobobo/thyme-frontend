ApplicationRoute = Ember.Route.extend
  beforeModel: ->
    @store.find 'timer',
      running: true
    .then (timers) =>
      Ember.RSVP.resolve timers.get('firstObject')
    .then (timer) =>
      theTask = null
      if timer?
        @store.find 'task', timer.get('taskId')
        .then (task) =>
          task.getTimers()
        .then (task) =>
          theTask = task
          timer.set 'task', task
          @store.find 'client', task.get('clientId')
        .then (client) =>
          theTask.set 'client', client
          @set 'common.currentTimer', timer
          Ember.RSVP.resolve timer
      else
        Ember.RSVP.resolve null


`export default ApplicationRoute`
