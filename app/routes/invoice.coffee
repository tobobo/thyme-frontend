InvoiceRoute = Ember.Route.extend
  model: (params) ->
    @modelFor('client').getTasks().then =>
      @store.find 'invoice', params.invoiceId
  afterModel: (model) ->
    model.set 'client', @modelFor('client')
    if model.get('download')
      window.open model.get('fileUrl'), '_blank'

  serialize: (model) ->
    invoiceId: model.get('id')


`export default InvoiceRoute`
