App.Router.reopen
  location: 'history'
  rootURL: '/'

App.Router.map (match) ->
  match('/').to 'home'
  match('/users').to 'users', (match) ->
    match('/new').to 'new'
    match('/:user_id/edit').to 'edit'
    match('/:user_id').to 'show'

App.HomeRoute = Ember.Route.extend
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

App.Users.ShowRoute = App.UserRoute.extend()

App.Users.EditRoute = App.UserRoute.extend()
