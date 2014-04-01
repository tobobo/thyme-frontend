TaskController = Ember.ObjectController.extend
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
  newTimer: (->
    if @get('id')?
      timer = @store.createRecord 'timer',
        taskId: @get('id')
      timer.one 'didCreate', =>
        @get('timers').unshiftObject timer
      timer
  ).property 'id', 'newTimer.isNew'


`export default TaskController`
