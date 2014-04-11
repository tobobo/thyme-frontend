ClientIndexRoute = Ember.Route.extend
  model: ->
    @modelFor 'client'
  beforeModel: (transition) ->
    if @modelFor('client').get('tasks.firstObject')
      @replaceWith 'task',
        @modelFor('client').get('tasks.firstObject')
    else
      @replaceWith 'tasks'


`export default ClientIndexRoute`
