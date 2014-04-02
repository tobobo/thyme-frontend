Task = DS.Model.extend
  name: DS.attr 'string'
  slug: DS.attr 'string'
  clientId: DS.attr 'string'
  duration: DS.attr 'number'
  calculatedDuration: (->
    if @cacheFor('timers')?
      mapped = @get('timers').mapProperty('duration').reduce (a, b) ->
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

`export default Task`
