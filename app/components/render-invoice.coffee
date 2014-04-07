RenderInvoiceComponent = Ember.Component.extend
  didInsertElement: ->
    @updateHTML()
    @get('invoice').on 'contentChanged', @, @updateHTML
  willDestroyElement: ->
    @get('invoice').off 'contentChanged', @updateHTML
  updateHTML: ->
    $el = @$()
    if $el?
      @set 'invoice.html', @$().html().replace(/<script[^<]*<\/script>/g, '')
`export default RenderInvoiceComponent`
