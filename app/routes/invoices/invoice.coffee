InvoiceRoute = Ember.Route.extend
  setupController: (controller, model) ->
    controller.set 'model', model
    debugger
    if model.get('download')
      debugger
      window.open model.get('url')

`export default InvoiceRoute`
