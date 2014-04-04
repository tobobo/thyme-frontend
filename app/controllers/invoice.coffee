InvoiceController = Ember.ObjectController.extend
  invoiceUrl: (->
    "http://localhost:8888/files/invoices/#{@get('id')}.pdf"
  ).property 'id'

`export default InvoiceController`
