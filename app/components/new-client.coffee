NewClientComponent = Ember.Component.extend
  didInsertElement: ->
    @$('input:first').focus()

    @$('input').on 'keydown.newClient', (e) =>
      if e.keyCode == 13
        @send 'save'

    @$('textarea').on 'keydown.newClient', (e) =>
      if e.metaKey and e.keyCode == 13
        @send 'save'

  willDestroyElement: ->
    @$('input').off 'keydown.newClient'

  client: {}
  actions:
    save: ->
      @get('client').save()

`export default NewClientComponent`
