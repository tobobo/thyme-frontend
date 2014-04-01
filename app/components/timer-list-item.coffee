TimerListItemComponent = Ember.Component.extend
  duration: (->
    startTime = if @get('timer.startTime') then @get('timer.startTime').getTime() else 0
    endTime = if @get('timer.endTime') then @get('timer.endTime').getTime() else 0
    (endTime - startTime)/1000
  ).property 'timer.startTime', 'timer.endTime'
  actions:
    start: ->
      unless @get('timer.running')
        @get('timer').setProperties
          running: true
          startTime: new Date()
          endTime: new Date((new Date()).getTime() + 1000)
        @get('timer').save()

`export default TimerListItemComponent`
