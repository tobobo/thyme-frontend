InvoicesNewRoute = Ember.Route.extend
  beforeModel: ->
    (=>
      if @modelFor('client').get('tasks')?
        Ember.RSVP.resolve @modelFor('client').get('tasks')
      else
        @modelFor('client').getTasks()
    )().then (tasks) =>
      Ember.RSVP.all(
        tasks.map (task) =>
          if task.get('timers')?
            Ember.RSVP.resolve task
          else
            task.getTimers()
      )

  model: ->
    @modelFor('client').createInvoice()

  afterModel: (model) ->
    @modelFor('client').get('tasks').setEach 'startDate', model.get('startDate')
    @modelFor('client').get('tasks').setEach 'endDate', model.get('endDate')


`export default InvoicesNewRoute`
