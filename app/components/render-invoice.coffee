RenderInvoiceComponent = Ember.Component.extend
  didInsertElement: ->
    @saveHTML()

  saveHTML: ->
    @set 'invoice.html', @$().html()

`export default RenderInvoiceComponent`
