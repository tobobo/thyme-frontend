Task = DS.Model.extend
  name: DS.attr 'string'
  slug: DS.attr 'string'
  clientId: DS.attr 'string'
  duration: DS.attr 'number'
  calculatedDuration: (->
    if @cacheFor('timers')?
      Math.round @get('timers').mapProperty('duration').reduce (a, b) ->
        a + b
      , 0
    else
      @get('duration') or 0
  ).property 'timers.@each.duration'
  timers: ((prop, value) ->
    if value? then value
    else
      if @get('id')?
        @store.find 'timer',
          taskId: @get('id')
        .then (timers) =>
          @set prop, timers
        , (error) =>
          console.log 'error getting timers', error
      else
        @set prop, Ember.ArrayProxy.create
          content: []

      Ember.ArrayProxy.create
        content: []
        isLoading: true
  ).property 'id'
  calculatedRate: (->
    rate = @get('rate') or @get('client.rate')
    if rate then rate else null
  ).property 'client.rate', 'rate'
  calculatedEarnings: (->
    console.log @get('calculatedDuration'), @get('calculatedRate')
    @get('calculatedDuration')*@get('calculatedRate')/(60*60)
  ).property 'calculatedDuration', 'calculatedRate'

`export default Task`
