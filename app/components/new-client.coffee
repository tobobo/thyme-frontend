NewClientComponent = Ember.Component.extend
  client: {}
  actions:
    save: ->
      @get('client').save()

`export default NewClientComponent`
