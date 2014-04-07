PrettyTextHelper = Ember.Handlebars.makeBoundHelper (content) ->
  new Ember.Handlebars.SafeString content.replace(/\n/g, '<br>')

`export default PrettyTextHelper`
