NewTimerComponent = Ember.Component.extend
  actions:
    save: ->
      if @get('timer')?
        @get('timer').save()

`export default NewTimerComponent`
