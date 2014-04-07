Client = DS.Model.extend
  name: DS.attr 'string'
  slug: DS.attr 'string'
  email: DS.attr 'string'
  contact: DS.attr 'string'
  rate: DS.attr 'number'
  invoicePrefix: DS.attr 'string'
  nextInvoice: DS.attr 'number'
  nextInvoiceFormatted: (->
    nextInvoice = "#{@get('nextInvoice')}"
    nextInvoice = 0 + nextInvoice while nextInvoice.length < 5
    nextInvoice
  ).property 'nextInvoice'
  getTasks: ->
    @store.find 'task',
      clientId: @get('id')
    .then (tasks) =>
      @set 'tasks', tasks
      tasks.setEach 'client', @
      Ember.RSVP.resolve tasks

`export default Client`
