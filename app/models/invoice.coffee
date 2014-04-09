Invoice = DS.Model.extend Ember.Evented,
  number: DS.attr 'string'
  clientId: DS.attr 'string'
  html: DS.attr 'string'
  createdAt: DS.attr 'date'
  fileUrl: DS.attr 'string'
  path: DS.attr 'string'
  startDate: DS.attr 'date'
  endDate: DS.attr 'date'
  datesDidChange: (->
    if @get('client.tasks')?
      @get('client.tasks').setEach 'startDate', @get('startDate')
      @get('client.tasks').setEach 'endDate', @get('endDate')
  ).observes('client.tasks.@each', 'startDate', 'endDate')
  filteredTasks: (->
    if @get('client.tasks')?
      @get('client.tasks').filter (task) =>
        task.get('invoiceEarnings') > 0
  ).property 'client.tasks.@each.invoiceEarnings'
  totalEarnings: (->
    if @get('client.tasks')?
      @get('client.tasks').mapBy('invoiceEarnings').reduce (a, b) ->
        a + b
      , 0
    else
      0
  ).property 'client.tasks.@each.invoiceEarnings'
  totalDuration: (->
    if @get('client.tasks')?
      @get('client.tasks').mapBy('invoiceDuration').reduce (a, b) ->
        a + b
      , 0
    else
      0
  ).property 'client.tasks.@each.invoiceDuration'

`export default Invoice`
