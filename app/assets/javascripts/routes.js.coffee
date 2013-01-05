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

App.UsersIndexRoute = Ember.Route.extend
  model: ->
    App.User.find()
  setupControllers: (controller, model) ->
    @controllerFor('application').set('currentRoute', 'users')
    controller.set('users', model)
