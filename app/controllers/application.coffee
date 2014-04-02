ApplicationController = Ember.ObjectController.extend
  currentTimer: null
  setTimer: (timer) ->
    if @get('currentTimer')?
      @get('currentTimer').setProperties
        endTime: new Date()
        running: false
      @get('currentTimer').save()
    @set 'currentTimer', timer

  actions:
    openCurrentTimer: ->
      if @get('currentTimer')?
        @transitionToRoute 'task', @get('currentTimer.client'), @get('currentTimer.task')

`export default ApplicationController`
