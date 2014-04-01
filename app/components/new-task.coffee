NewTaskComponent = Ember.Component.extend
  actions:
    save: ->
      if @get('task')?
        @get('task').save()

`export default NewTaskComponent`
