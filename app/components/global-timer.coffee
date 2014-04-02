GlobalTimerComponent = Ember.Component.extend
  endTimeUpdating: false

  didInsertElement: ->
    @startUpdating()

  runningDidChange: (->
    if @get('timer.running') and not @get('endTimeUpdating')
      @startUpdating()
    else if not @get('timer.running')
      @set('endTimeUpdating', false)
      Ember.run.cancel(@get('updateTimer'))

  ).observes 'timer.running'

  endTimeUpdatingDidChange: (->
  ).observesBefore 'endTimeUpdating'

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
    @set 'updateTimer', Ember.run.later( =>
      @endTimeUpdater()
    , 1000)

  actions:
    stop: ->
      if @get('timer.running')
        Ember.run.cancel @get('updateTimer')
        @get('timer').setProperties
          running: false
          endTime: new Date()
        @get('timer').save()

`export default GlobalTimerComponent`
