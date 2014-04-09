InvoicePreviewsIndexRoute = Ember.Route.extend
  beforeModel: (transition) ->
    @replaceWith 'index'

`export default InvoicePreviewsIndexRoute`
