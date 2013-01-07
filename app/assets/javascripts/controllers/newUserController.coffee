App.NewUserController = Ember.ObjectController.extend
  create: ->
    @store.commit()
    @content.addObserver 'id', @, 'afterCreate'

  afterCreate: ->
    @content.removeObserver 'id', @, 'afterCreate'
    @transitionTo('showUser', @content)

  cancel: ->
    @content.rollback()
    @transitionTo('usersIndex')
