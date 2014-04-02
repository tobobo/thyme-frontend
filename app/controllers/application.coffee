ApplicationController = Ember.ObjectController.extend
  currentTimer: ((prop, value) ->
    if value? then value
    else
      @store.find 'timer',
        running: true
      .then (timers) =>
        if timers.get('firstObject')
          console.log 'finding tasks'
          timer = timers.get('firstObject')
          @store.find 'task',
            id: timer.get('taskId')
        else
          new Ember.RSVP.Promise (resolve, reject) =>
            reject 0
      .then (tasks) =>
        console.log 'found tasks', tasks
        if tasks? and tasks.get('firstObject')?
          task = tasks.get('firstObject')
          timer.set 'task', task
          @store.find 'client',
            id: task.get('clientId')
      .then (clients) =>
        if clients.get('firstObject')?
          client = clients.get('firstObject')
          timer.set 'client', client
          @set prop, timer
      null
  ).property()
  setTimer: (timer) ->
    @set 'currentTimer', timer

`export default ApplicationController`
