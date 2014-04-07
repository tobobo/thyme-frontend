dateHelper = Ember.Handlebars.makeBoundHelper (date, format) ->
  moment(date).format format

`export default dateHelper`
