TasksController = Ember.ArrayController.extend
  newTaskDidCreate: (->
    if @get('client.newTask.id')
      @transitionToRoute 'task', @get('client.newTask')
  ).observes 'client.newTask.id'

`export default TasksController`
