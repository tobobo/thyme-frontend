Router = Ember.Router.extend
  location: 'history'

Router.map ->
  @route '/'
  @resource 'clients',
    path: 'clients'
  , ->
    @route 'new'
    @resource 'client',
      path: ':slug'
    , ->
      @resource 'tasks',
        path: 'tasks'
      , ->
        @resource 'task',
          path: ':slug'
      @resource 'invoices',
        path: 'invoices'
      , ->
        @resource 'invoice',
          path: ':id'
        @route 'new',
          path: 'new'

`export default Router`
