Meteor.publish "pastQueries", ->
  PastQueries.find()