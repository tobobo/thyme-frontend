TaskRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'task',
      slug: params.taskSlug
      clientId: @modelFor('client').get('id')
    .then (clients) =>
      new Ember.RSVP.Promise (resolve, reject) =>
        resolve clients.get('firstObject')
    , (error) =>
      reject error

  serialize: (model) ->
    taskSlug: model.get('slug')

`export default TaskRoute`
