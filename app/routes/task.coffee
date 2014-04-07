TaskRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'task',
      slug: params.taskSlug
      clientId: @modelFor('client').get('id')
    .then (tasks) =>
      Ember.RSVP.resolve tasks.get('firstObject')
    , (error) =>
      reject error

  afterModel: (model) ->
    model.set 'client', @modelFor('client')

  serialize: (model) ->
    taskSlug: model.get('slug')

`export default TaskRoute`
