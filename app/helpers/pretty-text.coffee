PrettyTextHelper = Ember.Handlebars.makeBoundHelper (content) ->
  if content? then new Ember.Handlebars.SafeString content.replace(/\n/g, '<br>')

`export default PrettyTextHelper`
