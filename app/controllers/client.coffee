ClientController = Ember.ObjectController.extend
  tasks: []
  modelDidChange: (->
    if @get('id')?
      @get('tasks').clear()
      @store.find 'task',
        clientId: @get('id')
      .then (tasks) =>
        @get('tasks').pushObjects tasks.get('content')
  ).observes 'id'
  newTask: (->
    if @get('id')?
      task = @store.createRecord 'task',
        clientId: @get('id')
      task.on 'didCreate', =>
        @get('tasks').pushObject task 
      task
  ).property 'id', 'newTask.isNew'


`export default ClientController`
