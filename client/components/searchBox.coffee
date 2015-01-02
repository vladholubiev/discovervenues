Template.searchBox.events "submit form": (e) ->
  e.preventDefault()

  searchQuery = $(e.target).find("input").val()
  if Meteor.user()
    alert searchQuery
  else alert "Please log in to perform search"
  return