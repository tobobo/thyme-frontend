RenderInvoiceComponent = Ember.Component.extend
  didInsertElement: ->
    @updateHTML()
    @get('invoice').on 'contentChanged', @, @updateHTML
  willDestroyElement: ->
    @get('invoice').off 'contentChanged', @updateHTML
  updateHTML: ->
    $el = @$()
    if $el?
      @set 'invoice.html', 
        @$().html()
          .replace(/<script[^<]*<\/script>/g, '')
          .replace(/invoice-container/g, "invoice-container-#{Math.round(Math.random()*1000000)}")
          
`export default RenderInvoiceComponent`
