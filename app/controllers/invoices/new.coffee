InvoicesNewController = Ember.ObjectController.extend
  actions:
    save: ->
      @get('model').save().then =>
        @set 'model.download', true
        @transitionToRoute 'invoice', @get('model')

`export default InvoicesNewController`
