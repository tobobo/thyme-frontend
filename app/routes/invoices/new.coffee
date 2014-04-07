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
    invoice = @store.createRecord 'invoice',
      clientId: client.get('id')
      number: client.get('invoicePrefix') + client.get('nextInvoiceFormatted')
      createdAt: new Date()

  afterModel: (model) ->
    model.set 'client', @modelFor('client')

`export default InvoicesNewRoute`
