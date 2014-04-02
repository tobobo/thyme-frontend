TimerListItemComponent = Ember.Component.extend

  actions:
    stop: ->
      if @get('timer.running')
        @get('timer').setProperties
          running: false
          endTime: new Date()
        @get('timer').save()

    delete: ->
      @get('timer.task.timers').removeObject @get('timer')
      @get('timer').deleteRecord()
      @get('timer').save()

`export default TimerListItemComponent`
