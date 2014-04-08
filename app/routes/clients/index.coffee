ClientsIndexRoute = Ember.Route.extend
  model: ->
    @modelFor('clients')

  afterModel: (model) ->
    if Ember.get('App.applicationController.currentTimer')?
      Ember.get('App.applicationController').send 'openCurrentTimer'
    else
      firstClient = model.get('firstObject')
      if firstClient?
        @transitionTo 'client', firstClient
    true

`export default ClientsIndexRoute`
