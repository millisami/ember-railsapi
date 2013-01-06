App.Router.reopen
  location: 'history'
  rootURL: '/'

App.Router.map (match) ->
  match('/').to 'home'
  match('/users').to 'users', (match) ->
    match('/').to 'usersIndex'
    match('/new').to 'newUser'
    match('/:user_id/edit').to 'editUser'
    match('/:user_id').to 'showUser'

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

App.ShowUserRoute = App.UserRoute.extend()

App.EditUserRoute = App.UserRoute.extend()
