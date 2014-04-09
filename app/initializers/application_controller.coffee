applicationControllerInitializer = ->
  Ember.Application.initializer
    name: 'injectApplicationController'
    initialize: (container, application) ->

      container.lookup 'controller:application'

      for type in ['controller']
        for name in ['appC', 'appController', 'applicationController']
          container.typeInjection type, name, 'controller:application'



`export default applicationControllerInitializer`
