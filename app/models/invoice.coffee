Invoice = DS.Model.extend
  number: DS.attr 'string'
  clientId: DS.attr 'string'
  html: DS.attr 'string'
  createdAt: DS.attr 'date'
  fileUrl: DS.attr 'string'
  path: DS.attr 'string'
  totalEarnings: (->
    if @get('client.tasks')?
      @get('client.tasks').mapBy('calculatedEarnings').reduce (a, b) ->
        a + b
      , 0
    else
      0
  ).property 'client.tasks.@each.calculatedEarnings'
  totalDuration: (->
    if @get('client.tasks')?
      @get('client.tasks').mapBy('calculatedDuration').reduce (a, b) ->
        a + b
      , 0
    else
      0
  ).property 'client.tasks.@each.calculatedDuration'

`export default Invoice`
