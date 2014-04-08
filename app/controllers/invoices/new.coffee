InvoicesNewController = Ember.ObjectController.extend
  datesDidChange: (->
    console.log 'dates changed', @get('startDate'), @get('endDate'), @get('model.client.tasks.length')
    if @get('model.client.tasks')?
      @get('model.client.tasks').setEach 'startDate', @get('startDate')
      @get('model.client.tasks').setEach 'endDate', @get('endDate')
  ).observes('model.client.tasks.@each', 'startDate', 'endDate')
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
