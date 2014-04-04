TaskController = Ember.ObjectController.extend
  sortedTimers: Ember.computed.sort 'timers', (a, b) ->
    aEnd = a.get('endTime')
    bEnd = b.get('endTime')
    if aEnd? and bEnd?
      if aEnd > bEnd
        -1
      else if aEnd < bEnd
        1
      else
        0
    else if aEnd?
      -1
    else if bEnd?
      1
    else
      0
  newTimer: (->
    if @get('id')?
      timer = @store.createRecord 'timer',
        taskId: @get('id')
        client: @get('client')
      timer.one 'didCreate', (thisTimer) =>
        thisTimer.set 'task', @get('model')
        if thisTimer.get('running')
          Ember.get('App.applicationController').setTimer thisTimer
        @get('timers').pushObject thisTimer
      timer
  ).property 'id', 'newTimer.isNew'


`export default TaskController`
