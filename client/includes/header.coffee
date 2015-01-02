Template.header.helpers "userName": ->
  if Meteor.user()
    Meteor.user().profile.name
  else ""