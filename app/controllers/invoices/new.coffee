InvoicesNewController = Ember.ObjectController.extend
  actions:
    save: ->
      @get('model').save()
      
`export default InvoicesNewController`
