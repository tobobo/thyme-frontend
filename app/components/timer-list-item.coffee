TimerListItemComponent = Ember.Component.extend

  actions:
    stop: ->
      if @get('timer.running')
        @get('timer').setProperties
          running: false
          endTime: new Date()
        @get('timer').save()

`export default TimerListItemComponent`
