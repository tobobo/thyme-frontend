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
    @createInvoice()

  createInvoice: ->
    client = @modelFor('client')
    if @modelFor('invoices').get('lastObject.endDate')
      startDate = new Date(moment(@modelFor('invoices').get('lastObject.endDate')).add('days', 1))
    else
      startDate = new Date()
      @modelFor('client').get('tasks').forEach (task) =>
        task.get('timers').forEach (timer) =>
          thisStartTime = timer.get('startTime')
          if thisStartTime < startDate
            startDate = thisStartTime
      startDate
    invoice = @store.createRecord 'invoice',
      clientId: client.get('id')
      number: client.get('invoicePrefix') + client.get('nextInvoiceFormatted')
      createdAt: new Date()
      startDate: startDate
      endDate: new Date()

  afterModel: (model) ->
    model.set 'client', @modelFor('client')
    @modelFor('client').get('tasks').setEach 'startDate', model.get('startDate')
    @modelFor('client').get('tasks').setEach 'endDate', model.get('endDate')


`export default InvoicesNewRoute`
