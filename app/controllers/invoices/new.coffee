InvoicesNewController = Ember.ObjectController.extend
  actions:
    save: ->
      @get('model').save().then =>
        @transitionToRoute 'invoice', @get('model')

`export default InvoicesNewController`
