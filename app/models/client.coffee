Client = DS.Model.extend
  name: DS.attr 'string'
  slug: DS.attr 'string'
  email: DS.attr 'string'
  contact: DS.attr 'string'
  rate: DS.attr 'number'

`export default Client`
