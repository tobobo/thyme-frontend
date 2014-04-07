TasksView = Ember.View.extend

  didInsertElement: ->
    $('body').on 'keydown.tasks', (e) =>
      if e.ctrlKey
        unless e.shiftKey
          if e.keyCode >= 49 and e.keyCode <= 57
            task = @get('controller.model').objectAt e.keyCode - 49
            if task? then @get('controller').transitionToRoute 'task', task

  willDestroyElement: ->
    $('body').off 'keydown.tasks'

`export default TasksView`
