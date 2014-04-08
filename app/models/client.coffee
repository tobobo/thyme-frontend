Client = DS.Model.extend
  name: DS.attr 'string'
  slug: DS.attr 'string'
  email: DS.attr 'string'
  contact: DS.attr 'string'
  rate: DS.attr 'number'
  invoicePrefix: DS.attr 'string'
  nextInvoice: DS.attr 'number'
  nextInvoiceFormatted: (->
    nextInvoice = "#{@get('nextInvoice')}"
    nextInvoice = 0 + nextInvoice while nextInvoice.length < 5
    nextInvoice
  ).property 'nextInvoice'
  getTasks: ->
    @store.find 'task',
      clientId: @get('id')
    .then (tasks) =>
      @set 'tasks', tasks
      tasks.setEach 'client', @
      Ember.RSVP.resolve tasks
  newTask: (->
    if @get('id')?
      task = @store.createRecord 'task',
        clientId: @get('id')
      task.one 'didCreate', (thisTask) =>
        @get('tasks').pushObject task
      task.set 'client', @
      task
  ).property 'id', 'newTask.isNew'
  createInvoice: ->
    if @get('invoices.lastObject.endDate')
      startDate = new Date(moment(@get('invoices.lastObject.endDate')).add('days', 1))
    else
      startDate = new Date()
      @get('tasks').forEach (task) =>
        task.get('timers').forEach (timer) =>
          thisStartTime = timer.get('startTime')
          if thisStartTime < startDate
            startDate = thisStartTime
      startDate
    invoice = @store.createRecord 'invoice',
      clientId: @get('id')
      number: @get('invoicePrefix') + @get('nextInvoiceFormatted')
      createdAt: new Date()
      startDate: startDate
      endDate: new Date()
    invoice.set 'client', @
    invoice

`export default Client`
