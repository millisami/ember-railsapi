App.NavMenuView = Ember.View.extend
  tagName: 'ul'
  classNames: ['nav']
  isHome: (->
    @get('currentUrl') == '/'
  ).property('currentUrl')
  isUsers: (->
    @get('currentUrl').match '/users'
  ).property('currentUrl')
  currentUrl: (->
    debugger
    window.location.pathname
  ).property()
