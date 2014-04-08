ClientsIndexRoute = Ember.Route.extend
  model: ->
    @modelFor('clients')

  afterModel: ->
    if Ember.get('App.applicationController.currentTimer')?
      Ember.get('App.applicationController').send 'openCurrentTimer'
    firstClient = @modelFor('clients').get('firstObject')
    if firstClient?
      @transitionTo 'client', firstClient
    true

`export default ClientsIndexRoute`
