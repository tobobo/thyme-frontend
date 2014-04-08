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
          path: ':invoiceNumber'
        @route 'new',
          path: 'new'

  @resource 'invoicePreviews',
    path: 'invoices'
  , ->
    @resource 'invoicePreview',
      path: ':invoicePreviewId'

`export default Router`
