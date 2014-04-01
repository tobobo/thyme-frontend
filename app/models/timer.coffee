Timer = DS.Model.extend
  startTime: DS.attr 'date'
  endTime: DS.attr 'date'
  taskId: DS.attr 'string'

`export default Timer`
