ClientsIndexRoute = Ember.Route.extend
  model: ->
    @modelFor('clients')

  beforeModel: (transition) ->
    if @controllerFor('application').get('currentTimer')?
      transition.then => @controllerFor('application').send 'openCurrentTimer'
    else
      firstClient = @modelFor('clients').get('firstObject')
      if firstClient?
        transition.then => @replaceWith 'client', firstClient
    return

`export default ClientsIndexRoute`
