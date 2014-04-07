ClientRoute = Ember.Route.extend
  model: (params) ->
    client = null
    @store.find 'client',
      slug: params.clientSlug
    .then (clients) =>
      Ember.RSVP.resolve clients.get('firstObject')

  setupController: (controller, model) ->
    controller.set 'model', model

  serialize: (model) ->
    clientSlug: model.get('slug')

  currentClientIndex: ->
    currentClientIndex = -1
    @modelFor('clients').find (item, index) =>
      if item.get('id') == @get('controller.model.id')
        currentClientIndex = index
        true
    currentClientIndex

  actions:
    nextClient: ->
      client = @modelFor('clients').objectAt(@currentClientIndex() + 1)
      if client? then @transitionTo 'client', client
      return

    previousClient: ->
      client = @modelFor('clients').objectAt(@currentClientIndex() - 1)
      if client? then @transitionTo 'client', client
      return

`export default ClientRoute`
