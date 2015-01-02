Meteor.publish "pastQueries", ->
  PastQueries.find {},
    sort:
      date: 1
    limit: 5