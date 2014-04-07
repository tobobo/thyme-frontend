ClientRoute = Ember.Route.extend
  model: (params) ->
    client = null
    @store.find 'client',
      slug: params.clientSlug
    .then (clients) =>
      Ember.RSVP.resolve clients.get('firstObject')

  serialize: (model) ->
    clientSlug: model.get('slug')

`export default ClientRoute`
