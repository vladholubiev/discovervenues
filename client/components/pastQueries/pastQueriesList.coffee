Template.pastQueriesList.helpers pastQueries: ->
  userId = Meteor.userId() ? "anonymous"
  PastQueries.find {user: userId},
    sort:
      date: 1