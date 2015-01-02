Template.pastQuery.helpers dateFormatted: ->
  moment.unix(@date).format("MMM D H:mm")