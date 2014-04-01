ClientsNewController = Ember.ObjectController.extend
  modelDidSave: (->
    if !@get('model.isNew')
      @transitionToRoute('client', @get('model'))
  ).observes 'model.isNew'
`export default ClientsNewController`
