NewTaskComponent = Ember.Component.extend
  actions:
    save: ->
      debugger
      if @get('task')?
        @get('task').save()

`export default NewTaskComponent`
