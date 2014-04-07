ClientView = Ember.View.extend

  didInsertElement: ->
    $('body').on 'keydown.client', (e) =>
      if e.ctrlKey
        if e.keyCode == 73
          @get('controller').transitionToRoute 'invoices.new'
        else if e.shiftKey
          if e.keyCode == 219
            @get('controller').send 'previousClient'
          else if e.keyCode == 221
            @get('controller').send 'nextClient'
  willDestroyElement: ->
    $('body').off 'keydown.client'

`export default ClientView`
