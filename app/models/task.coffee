Task = DS.Model.extend
  name: DS.attr 'string'
  slug: DS.attr 'string'
  clientId: DS.attr 'string'
  duration: DS.attr 'number'
  filteredTimers: (->
    console.log 'filtering timers'
    if @get('startDate') or @get('endDate')?
      @get('timers').filter (timer) =>
        valid = true
        if @get('startDate')? then valid = valid and timer.get('endTime') > @get('startDate')
        if @get('endDate')? then valid = valid and timer.get('startTime') < @get('endDate')
        valid
    else
      null
  ).property 'startDate', 'endDate'
  calculatedDuration: (->
    timers = if @get('startDate')? or @get('endDate')? then @get('filteredTimers') else @get('timers')
    if timers
      timers.mapProperty('duration').reduce (a, b) ->
        a + b
      , 0
    else
      @get('duration') or 0
  ).property 'timers.@each.duration', 'filteredTimers.@each', 'duration', 'startDate', 'endDate'
  datesChanged: (->
    console.log 'dates changed'
  ).observesBefore 'startDate', 'endDate'
  calculatedRate: (->
    rate = @get('rate') or @get('client.rate')
    if rate then rate else null
  ).property 'client.rate', 'rate'
  calculatedEarnings: (->
    @get('calculatedDuration')*@get('calculatedRate')/(60*60)
  ).property 'calculatedDuration', 'calculatedRate'

`export default Task`
