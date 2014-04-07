TaskView = Ember.View.extend

  didInsertElement: ->
    $('body').on 'keydown.task', (e) =>
      if e.ctrlKey
        unless e.shiftKey
          if e.keyCode == 219
            @get('controller').send 'previousTask'
          else if e.keyCode == 221
            @get('controller').send 'nextTask'

  willDestroyElement: ->
    $('body').off 'keydown.task'

`export default TaskView`
