App.User = DS.Model.extend(
  firstName: attr('string')
  lastName:  attr('string')
  quote:     attr('string')
  age:       attr('number')
  fullName: (->
    "#{@get('firstName')} #{@get('lastName')}"
  ).property('firstName', 'lastName')
)
