ClientView = Ember.View.extend

  didInsertElement: ->
    $('body').on 'keydown.client', (e) =>
      if e.ctrlKey
        if e.keyCode == 73
          @get('controller').transitionToRoute 'invoices.new'

  willDestroyElement: ->
    $('body').off 'keydown.client'

`export default ClientView`
