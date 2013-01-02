App.Router.reopen
  location: 'history'
  rootURL: '/'

App.Router.map (match) ->
  match('/').to 'index'
  match('/users').to 'users'

App.UsersRoute = Ember.Route.extend
  model: ->
    App.User.find()
  setupControllers: (controller, model) ->
    controller.set('users', model)
