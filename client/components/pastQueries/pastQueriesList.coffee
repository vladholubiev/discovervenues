Template.pastQueriesList.helpers pastQueries: ->
  PastQueries.find {},
    sort:
      date: 1