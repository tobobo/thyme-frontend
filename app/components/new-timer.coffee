NewTimerComponent = Ember.Component.extend
  actions:
    save: ->
      if @get('timer')?
        @set 'timer.startTime', new Date()
        @get('timer').save()

`export default NewTimerComponent`
