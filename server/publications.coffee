Meteor.publish "pastQueries", ->
  PastQueries.find {},
    skip: PastQueries.find().count() - 5
