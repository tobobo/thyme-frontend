Router = Ember.Router.extend
  location: 'history'

Router.map ->
  @route '/'
  @resource 'clients',
    path: '/clients/'
  , ->
    @route 'new'
    @resource 'client',
      path: '/:clientSlug'

`export default Router`
