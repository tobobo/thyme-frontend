NewTaskComponent = Ember.Component.extend
  
  didInsertElement: ->
    $('body').on 'keydown.newtask', (e) =>
      if e.ctrlKey
        if e.keyCode == 78
          unless e.shiftKey
            @$('input').focus()

    @$('input').on 'keydown.newtask', (e) =>
      if e.keyCode == 13
        @send 'save'

  willDestroyElement: ->
    $('body').off 'keydown.newtask'
    @$('input').off 'keydown.newtask'

  actions:
    save: ->
      if @get('task')?
        @get('task').save()

`export default NewTaskComponent`
