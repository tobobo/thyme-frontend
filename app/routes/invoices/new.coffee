InvoicesNewRoute = Ember.Route.extend
  model: ->
    client = @modelFor('client')
    (->
      if client.get('tasks')?
        Ember.RSVP.resolve client.get('tasks')
      else
        client.getTasks()
    )().then (tasks) =>
      taskPromises = tasks.map (task) =>
        if task.get('timers')?
          Ember.RSVP.resolve task
        else
          @store.find 'timer',
            taskId: task.get('id')
          .then (timers) =>
            task.set 'timers', timers
            timers.setEach 'task', task
            Ember.RSVP.resolve task
      Ember.RSVP.all taskPromises
    .then (tasks) =>
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
    console.log @modelFor('client').get('tasks.firstObject')

  exit: ->
    tasks = @modelFor('client').get('tasks')
    if tasks?
      tasks.setEach 'filteredTimers', null
      tasks.setEach 'startDate', null
      tasks.setEach 'endDate', null


`export default InvoicesNewRoute`
