InvoicesNewView = Ember.View.extend

  didInsertElement: ->
    $('body').on 'keydown.invoicesNew', (e) =>
      if e.ctrlKey
        if e.keyCode == 83
          @get('controller').send 'save'

  willDestroyElement: ->
    $('body').off 'keydown.invoicesNew'

`export default InvoicesNewView`
