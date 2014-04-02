TaskController = Ember.ObjectController.extend
  sortedTimers: Ember.computed.sort 'timers', (a, b) ->
    aStart = a.get('startTime')
    bStart = b.get('startTime')
    if aStart? and bStart?
      if aStart > bStart
        -1
      else if aStart < bStart
        1
      else
        0
    else if aStart?
      -1
    else if bStart?
      1
    else
      0
  newTimer: (->
    if @get('id')?
      timer = @store.createRecord 'timer',
        taskId: @get('id')
        task: @get('model')
        client: @get('client')
        startTime: new Date()
        endTime: new Date()
        running: true
      timer.one 'didCreate', =>
        if timer.get('running')?
          Ember.get('App.applicationController').setTimer timer
        @get('timers').unshiftObject timer
      timer
  ).property 'id', 'newTimer.isNew'


`export default TaskController`
