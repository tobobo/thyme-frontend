Timer = DS.Model.extend
  startTime: DS.attr 'date'
  endTime: DS.attr 'date'
  taskId: DS.attr 'string'
  running: DS.attr 'boolean'
  duration: (->
    startTime = if @get('startTime') then @get('startTime').getTime() else 0
    endTime = if @get('endTime') then @get('endTime').getTime() else 0
    (endTime - startTime)/1000
  ).property 'startTime', 'endTime'

`export default Timer`
