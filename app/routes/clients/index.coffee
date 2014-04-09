ClientsIndexRoute = Ember.Route.extend
  model: ->
    @modelFor('clients')

  beforeModel: (transition) ->
    if @get('common.currentTimer')?
      transition.then => @get('common').send 'openCurrentTimer'
    else
      firstClient = @modelFor('clients').get('firstObject')
      if firstClient?
        transition.then => @replaceWith 'client', firstClient
    return

`export default ClientsIndexRoute`
