Timer = DS.Model.extend
  startTime: DS.attr 'date'
  endTime: DS.attr 'date'
  taskId: DS.attr 'string'
  running: DS.attr 'boolean'

`export default Timer`
