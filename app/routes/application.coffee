ApplicationRoute = Ember.Route.extend
  model: ->
    new Ember.RSVP.Promise (resolve, reject) =>
      timer = null
      @store.find 'timer',
        running: true
      .then (timers) =>
        if timers.get('firstObject')
          timer = timers.get('firstObject')
          @store.find('task', timer.get('taskId')).then (task) =>
            timer.set 'task', task
            @store.find 'client', task.get('clientId')
          .then (client) =>
            timer.set 'client', client
            resolve timer
        else
          resolve null

  setupController: (controller, model) ->
    controller.set 'currentTimer', model
    Ember.set 'App.applicationController', controller

`export default ApplicationRoute`
