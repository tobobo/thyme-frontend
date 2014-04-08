DateFieldComponent = Ember.Component.extend
  tagName: 'span'
  date: ((prop, value) ->
    if value? then value
    else
      if @get('dateInput')?
        date = moment @get('dateInput')
        if date.isValid() then new Date(date) else @cacheFor('date')
  ).property 'dateInput'

  dateInput: ((prop, value) ->
    if value? then value
    else
      if @get('date')?
        format = 'M/D/YYYY' or @get('format')
        moment(@get('date')).format(format)
  ).property 'date'

`export default DateFieldComponent`
