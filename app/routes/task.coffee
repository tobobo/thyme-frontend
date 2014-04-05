TaskRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'task',
      slug: params.taskSlug
      clientId: @modelFor('client').get('id')
    .then (tasks) =>
      new Ember.RSVP.Promise (resolve, reject) =>
        resolve tasks.get('firstObject')
    , (error) =>
      reject error

  afterModel: (model) ->
    model.set 'client', @modelFor('client')

  serialize: (model) ->
    taskSlug: model.get('slug')

`export default TaskRoute`
