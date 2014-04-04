TasksController = Ember.ArrayController.extend
  newTask: (->
    if @get('model.client.id')?
      task = @store.createRecord 'task',
        clientId: @get('model.client.id')
      task.set 'client', @get('model.client')
      task.one 'didCreate', =>
        @get('model').pushObject task
        @transitionToRoute 'task', task
      task
  ).property 'model.client.id', 'newTask.isNew'

`export default TasksController`
