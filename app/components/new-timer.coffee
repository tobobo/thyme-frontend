NewTimerComponent = Ember.Component.extend
  hours: 0
  minutes: 0
  seconds: 0
  newTimerDuration: (->
    +@get('hours')*60*60 + +@get('minutes')*60 + +@get('seconds')
  ).property 'hours', 'minutes', 'seconds'
  actions:
    save: (properties) ->
      debugger
      if @get('timer')?
        @get('timer').setProperties properties
        @get('timer').save()
    start: ->
      @send 'save',
        startTime: new Date()
        endTime: new Date()
        running: true

    quickAdd: ->
      @send 'save',
        startTime: new Date((new Date()).getTime() - @get('newTimerDuration')*1000)
        endTime: new Date()
        running: false
      @setProperties
        hours: 0
        minutes: 0
        seconds: 0


`export default NewTimerComponent`
