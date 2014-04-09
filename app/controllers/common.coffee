CommonController = Ember.Controller.extend
  currentTimer: null
  setTimer: (timer) ->
    if @get('currentTimer.running')
      @get('currentTimer').setProperties
        endTime: new Date()
        running: false
      @get('currentTimer').save()
    @set 'currentTimer', timer

  actions:
    openCurrentTimer: ->
      if @get('currentTimer')?
        @transitionToRoute 'task', @get('currentTimer.task.client'), @get('currentTimer.task')

`export default CommonController`
