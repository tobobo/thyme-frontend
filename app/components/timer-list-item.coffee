TimerListItemComponent = Ember.Component.extend
  endTimeUpdating: false

  didInsertElement: ->
    @startUpdating()

  runningDidChange: (->
    @startUpdating()
  ).observes 'timer.running'

  endTimeUpdater: ->
    if @get('endTimeUpdating')
      @set 'timer.endTime', new Date()
      @waitToUpdate()

  startUpdating: ->
    if @get('timer.running')
      @set 'endTimeUpdating', true
      @endTimeUpdater()
    else
      @set 'endTimeUpdating', false

  waitToUpdate: ->
    Ember.run.later =>
      @endTimeUpdater()
    , 1000

  actions:
    stop: ->
      if @get('timer.running')
        @get('timer').setProperties
          running: false
          endTime: new Date()
        @get('timer').save()

`export default TimerListItemComponent`
