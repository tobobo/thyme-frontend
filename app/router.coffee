Router = Ember.Router.extend
  location: 'history'

Router.map ->
  @route '/'
  @resource 'clients',
    path: 'clients'
  , ->
    @route 'new'
    @resource 'client',
      path: ':clientSlug'
    , ->
      @resource 'tasks',
        path: 'tasks'
      , ->
        @resource 'task',
          path: ':taskSlug'
      @resource 'invoices',
        path: 'invoices'
      , ->
        @resource 'invoice',
          path: ':id'
        @route 'new',
          path: 'new'

`export default Router`
