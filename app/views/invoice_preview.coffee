InvoicePreviewView = Ember.View.extend
  didInsertElement: ->
    @set 'oldTitle', window.title
    document.title = @get('controller.model.number')

  willDestroyElement: ->
    document.title = @get('oldTitle')


`export default InvoicePreviewView`
