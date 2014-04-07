InvoiceRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'invoice',
      number: params.invoiceNumber
    .then (invoices) =>
      Ember.RSVP.resolve invoices.get('firstObject')

  afterModel: (model) ->
    model.set 'client', @modelFor('client')
    if model.get('download')
      window.open model.get('fileUrl'), '_blank'

  serialize: (model) ->
    invoiceNumber: model.get('number')


`export default InvoiceRoute`
