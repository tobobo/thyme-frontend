ClientRoute = Ember.Route.extend
  model: (params) ->
    new Ember.RSVP.Promise (resolve, reject) =>
      @store.find 'client',
        slug: params.clientSlug
      .then (clients) ->
        resolve clients.get('firstObject')
      , (error) ->
        reject error

  serialize: (model) ->
    slug: model.get('slug')

`export default ClientRoute`
