App.EditUserController = Ember.ObjectController.extend
  destroy: ->
    @content.deleteRecord()
    @store.commit()
    @transitionTo('usersIndex')

  update: ->
    @store.commit()
    @transitionTo('showUser', @content)

  cancel: ->
    if @content.isDirty
      @content.rollback()
    @transitionTo('showUser', @content)
