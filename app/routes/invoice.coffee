InvoiceRoute = Ember.Route.extend
  setupController: (controller, model) ->
    controller.set 'model', model
    if model.get('download')
      window.open model.get('fileUrl')

`export default InvoiceRoute`
