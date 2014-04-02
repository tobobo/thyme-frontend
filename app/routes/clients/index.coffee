ClientsIndexRoute = Ember.Route.extend
  model: ->
    @modelFor('clients')

  afterModel: ->
    if Ember.get('App.applicationController.currentTimer')?
      Ember.get('App.applicationController').send 'openCurrentTimer'
    true

`export default ClientsIndexRoute`
