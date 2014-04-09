ClientsIndexRoute = Ember.Route.extend
  model: ->
    @modelFor('clients')

  beforeModel: (transition) ->
    if Ember.get('App.applicationController.currentTimer')?
      transition.then => Ember.get('App.applicationController').send 'openCurrentTimer'
    else
      firstClient = @modelFor('clients').get('firstObject')
      if firstClient?
        transition.then => @replaceWith 'client', firstClient
    return

`export default ClientsIndexRoute`
