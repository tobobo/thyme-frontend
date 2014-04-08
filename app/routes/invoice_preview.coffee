InvoicePreviewRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'invoice', params.invoicePreviewId
  serialize: (model) ->
    invoicePreviewId: model.get('id')

`export default InvoicePreviewRoute`
