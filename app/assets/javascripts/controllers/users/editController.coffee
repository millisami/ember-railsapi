App.UsersEditController = Ember.ObjectController.extend
  destroy: ->
    @content.deleteRecord()
    @store.commit()
    @transitionTo('users.index')

  update: ->
    @store.commit()
    @transitionTo('users.show', @content)

  cancel: ->
    if @content.isDirty
      @content.rollback()
    @transitionTo('users.show', @content)
