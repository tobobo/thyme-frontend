InvoicesRoute = Ember.Route.extend
  model: ->
    @store.find 'invoice',
      clientId: @modelFor('client').get('id')

  afterModel: (model) ->
    model.setEach 'client', @modelFor('client')
    @modelFor('client').set 'invoices', model

`export default InvoicesRoute`
