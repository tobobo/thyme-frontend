Task = DS.Model.extend
  name: DS.attr 'string'
  slug: DS.attr 'string'
  clientId: DS.attr 'string'
  duration: DS.attr 'number'
  filteredTimers: (->
    if @get('startDate') or @get('endDate')?
      if @get('timers')?
        endDate = new Date moment(@get('endDate')).add('days', 1)
        filteredTimers = @get('timers').filter (timer) =>
          valid = true
          if @get('startDate')? then valid = valid and timer.get('endTime') > @get('startDate')
          if @get('endDate')? then valid = valid and timer.get('startTime') < endDate
          valid
        filteredTimers
    else
      null
  ).property 'startDate', 'endDate', 'timers.@each'
  invoiceDuration: (->
    @calculateDuration @get('filteredTimers'), @get('duration')
  ).property 'filteredTimers.@each.duration', 'startDate', 'endDate'
  calculatedDuration: (->
    @calculateDuration @get('timers'), @get('duration')
  ).property 'id', 'timers.@each.duration', 'duration'
  calculatedRate: (->
    rate = @get('rate') or @get('client.rate')
    if rate then rate else null
  ).property 'client.rate', 'rate'
  calculatedEarnings: (->
    @calculateEarnings @get('calculatedDuration'), @get('calculatedRate')
  ).property 'calculatedDuration', 'calculatedRate'
  invoiceEarnings: (->
    @calculateEarnings @get('invoiceDuration'), @get('calculatedRate')
  ).property 'invoiceDuration', 'calculatedRate'
  calculateDuration: (timers, duration) ->
    if timers?
      timers.mapProperty('duration').reduce (a, b) ->
        a + b
      , 0
    else
      duration or 0

  calculateEarnings: (duration, rate) ->
    duration*rate/(60*60)

  getTimers: ->
    @store.find 'timer',
      taskId: @get('id')
    .then (timers) =>
      @set 'timers', timers
      timers.setEach 'task', @
      Ember.RSVP.resolve @

  newTimer: (->
    if @get('id')?
      timer = @store.createRecord 'timer',
        taskId: @get('id')
        client: @get('client')
      timer.one 'didCreate', (thisTimer) =>
        if thisTimer.get('running')
          Ember.get('App.applicationController').setTimer thisTimer
        @get('timers').pushObject thisTimer
      timer.set 'task', @
      timer
  ).property 'id', 'newTimer.isNew'

`export default Task`
