ClientsView = Ember.View.extend

  didInsertElement: ->
    $('body').bind 'keydown', @handleKeyPress.bind(@)

  handleKeyPress: (e) ->
    if e.ctrlKey
      if e.keyCode == 78
        if e.shiftKey
          @get('controller').transitionToRoute('clients.new')
      else if e.keyCode >= 49 and e.keyCode <= 57
        client = @get('controller.model').objectAt e.keyCode - 49
        if client? then @get('controller').transitionToRoute 'client', client

`export default ClientsView`
