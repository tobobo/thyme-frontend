TasksController = Ember.ArrayController.extend
  newTask: (->
    if @get('client.id')?
      task = @store.createRecord 'task',
        clientId: @get('client.id')
      task.one 'didCreate', =>
        @get('model').pushObject task
        @transitionToRoute 'task', task
      task
  ).property 'client.id', 'newTask.isNew'

`export default TasksController`
