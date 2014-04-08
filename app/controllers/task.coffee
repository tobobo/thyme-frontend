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
      
  actions:
    nextTask: -> true

    previousTask: -> true


`export default TaskController`
