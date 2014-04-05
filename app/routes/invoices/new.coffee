InvoicesNewRoute = Ember.Route.extend
  model: ->
    client = @modelFor('client')
    if client.get('tasks')?
      @createInvoice()
    else
      client.getTasks().then =>
        @createInvoice()

  createInvoice: ->
    client = @modelFor('client')
    invoice = @store.createRecord 'invoice',
      clientId: client.get('id')
      number: client.get('invoicePrefix') + client.get('nextInvoice')
      createdAt: new Date()

  afterModel: (model) ->
    model.set 'client', @modelFor('client')

`export default InvoicesNewRoute`
