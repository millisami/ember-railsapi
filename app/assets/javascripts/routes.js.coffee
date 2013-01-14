App.Router.reopen
  location: 'history'
  rootURL: '/'

App.Router.map ->
  @resource 'users', ->
    @route 'new'
    @route 'edit',
      path: '/:user_id/edit'
    @route 'show'
      path: '/:user_id'

App.IndexRoute = Ember.Route.extend
  setupController: (controller, model) ->
    @controllerFor('application').set('currentRoute', 'home')

App.UsersRoute = Ember.Route.extend
  setupController: (controller, model) ->
    @controllerFor('application').set('currentRoute', 'users')

App.UserRoute = App.UsersRoute.extend
  model: (params) ->
    App.User.find(params.user_id)
  setupController: (controller, model) ->
    @_super()
    controller.set('content', model)

App.UsersIndexRoute = App.UsersRoute.extend
  model: ->
    if App.User.isLoaded()
      App.User.all()
    else
      App.User.find()
  setupController: (controller, model) ->
    @_super()
    controller.set('users', model)

App.UsersNewRoute = App.UsersRoute.extend
  model: ->
    App.User.createRecord({firstName:'', lastName:''})
  setupController: (controller, model) ->
    @_super()
    controller.set('content', model)
