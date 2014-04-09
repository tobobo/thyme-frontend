InvoicesNewController = Ember.ObjectController.extend
  actions:
    save: ->
      @get('model').trigger 'contentChanged'
      @get('model').save().then =>
        @set 'model.download', true
        @get('model.client').incrementProperty('nextInvoice')
        @get('model.client').save()
      .then =>
        @transitionToRoute 'invoice', @get('model')

`export default InvoicesNewController`
