RenderInvoiceComponent = Ember.Component.extend
  didInsertElement: ->
    @saveHTML()

  saveHTML: ->
    @set 'invoice.html', @$().html().replace(/<script[^<]*<\/script>/g, '')

`export default RenderInvoiceComponent`
