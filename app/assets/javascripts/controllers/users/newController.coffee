App.UsersNewController = Ember.ObjectController.extend
  create: ->
    @store.commit()
    @content.addObserver 'id', @, 'afterCreate'

  afterCreate: ->
    @content.removeObserver 'id', @, 'afterCreate'
    @transitionTo('users.show', @content)

  cancel: ->
    @content.deleteRecord()
    @transitionTo('users.index')

  buttonTitle: 'Create'
  headerTitle: 'Creating'
