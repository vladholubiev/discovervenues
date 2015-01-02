Template.pastQuery.helpers dateFormatted: ->
  moment.unix(@date).format("MMM D H:mm")

Template.pastQuery.events "click i": ->
  PastQueries.remove @_id