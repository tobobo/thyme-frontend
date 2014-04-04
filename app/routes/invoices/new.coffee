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
    @store.createRecord 'invoice',
      clientId: client.get('id')
      createdAt: new Date()

  afterModel: (model) ->
    model.set 'client', @modelFor('client')

`export default InvoicesNewRoute`
