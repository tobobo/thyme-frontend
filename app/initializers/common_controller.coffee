Ember.Application.initializer
  name: 'injectCommon'
  initialize: (container, application) ->

    key = 'common:main'
    
    container.register key, container.lookup('controller:common'),
      instantiate: false

    for type in ['controller', 'route']
      for name in ['common']
        container.typeInjection type, name, key
        
`export default undefined`
