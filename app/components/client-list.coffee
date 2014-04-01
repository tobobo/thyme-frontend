ClientListComponent = Ember.Component.extend
  filteredClients: Ember.computed.filterBy 'clients', 'isNew', false
  tagName: 'ul'

`export default ClientListComponent`
