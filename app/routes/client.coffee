ClientRoute = Ember.Route.extend
  model: (params) ->
    client = null
    @store.find 'client',
      slug: params.clientSlug
    .then (clients) =>
      new Ember.RSVP.Promise (resolve, reject) =>
        resolve clients.get('firstObject')

  serialize: (model) ->
    clientSlug: model.get('slug')

`export default ClientRoute`
