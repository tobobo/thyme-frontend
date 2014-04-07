NewTimerComponent = Ember.Component.extend
  hours: 0
  minutes: 0
  seconds: 0
  newTimerDuration: (->
    +@get('hours')*60*60 + +@get('minutes')*60 + +@get('seconds')
  ).property 'hours', 'minutes', 'seconds'

  didInsertElement: ->
    $('.quick-add input').on 'keydown.newtimer', (e) =>
      if e.keyCode == 13
        @send 'quickAdd'

    $('body').on 'keydown.newtimer', (e) =>
      if e.ctrlKey
        if e.keyCode == 84
          unless @get('globalTimer.running')
            @send 'start'
        else if e.keyCode == 65
          Ember.run.next =>
            @$('.quick-add input:first').select()

  willDestroyElement: ->
    $('body').off 'keydown.newtimer'
    $('.quick-add input').off 'keydown.newtimer'

  actions:
    save: (properties) ->
      if @get('timer')?
        @get('timer').setProperties properties
        @get('timer').save()
        
    start: ->
      @send 'save',
        startTime: new Date()
        endTime: new Date()
        running: true

    quickAdd: ->
      @send 'save',
        startTime: new Date((new Date()).getTime() - @get('newTimerDuration')*1000)
        endTime: new Date()
        running: false
      @setProperties
        hours: 0
        minutes: 0
        seconds: 0


`export default NewTimerComponent`
