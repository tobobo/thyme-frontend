Client = DS.Model.extend
  name: DS.attr 'string'
  slug: DS.attr 'string'
  email: DS.attr 'string'
  contact: DS.attr 'string'
  rate: DS.attr 'number'
  getTasks: ->
    @store.find 'task',
      clientId: @get('id')
    .then (tasks) =>
      new Ember.RSVP.Promise (resolve, reject) =>
        @set 'tasks', tasks
        tasks.setEach 'client', @
        resolve tasks

`export default Client`
