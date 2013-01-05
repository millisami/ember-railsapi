App.Router.reopen
  location: 'history'
  rootURL: '/'

App.Router.map (match) ->
  match('/').to 'home'
  match('/users').to 'users', (match) ->
    match('/').to 'usersIndex'
    match('/new').to 'newUser'
    match('/:user_id').to 'showUser'

App.HomeRoute = Ember.Route.extend
  setupControllers: (controller, model) ->
    @controllerFor('application').set('currentRoute', 'home')

App.UsersRoute = Ember.Route.extend
  setupControllers: (controller, model) ->
    @controllerFor('application').set('currentRoute', 'users')

App.UsersIndexRoute = App.UsersRoute.extend
  model: ->
    App.User.find()
  setupControllers: (controller, model) ->
    @_super()
    controller.set('users', model)

App.ShowUserRoute = App.UsersRoute.extend
  model: (params) ->
    App.User.find(params.user_id)
  setupControllers: (controller, model) ->
    @_super()
    controller.set('content', model)
