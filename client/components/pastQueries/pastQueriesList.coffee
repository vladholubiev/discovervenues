Template.pastQueriesList.helpers pastQueries: ->
  PastQueries.find {},
    skip: PastQueries.find().count() - 5