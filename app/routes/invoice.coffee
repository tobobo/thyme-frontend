InvoiceRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'invoice',
      number: params.invoiceNumber
    .then (invoices) =>
      new Ember.RSVP.Promise (resolve, reject) =>
        resolve invoices.get('firstObject')

  afterModel: (model) ->
    model.set 'client', @modelFor('client')
    if model.get('download')
      window.open model.get('fileUrl'), '_blank'

  serialize: (model) ->
    invoiceNumber: model.get('number')


`export default InvoiceRoute`
