ClientsNewController = Ember.ObjectController.extend
  modelDidSave: (->
    if !@get('model.isNew')
      @transitionToRoute('clients')
  ).observes 'model.isNew'
`export default ClientsNewController`
