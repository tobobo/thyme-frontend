ClientsView = Ember.View.extend

  didInsertElement: ->
    $('body').on 'keydown.clients', (e) =>
      if e.ctrlKey
        if e.keyCode == 78
          if e.shiftKey
            @get('controller').transitionToRoute('clients.new')
        else if e.keyCode >= 49 and e.keyCode <= 57
          unless e.shiftKey
            client = @get('controller.model').objectAt e.keyCode - 49
            if client? then @get('controller').transitionToRoute 'client', client

  willDestroyElement: ->
    $('body').off 'keydown.clients'

`export default ClientsView`
