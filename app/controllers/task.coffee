TaskController = Ember.ObjectController.extend
  newTimerDidCreate: (->
    if @get('newTimer.id')
      @appC.setTimer @get('newTimer')
  ).observes 'newTimer.id'
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
      
  actions:
    nextTask: -> true

    previousTask: -> true


`export default TaskController`
