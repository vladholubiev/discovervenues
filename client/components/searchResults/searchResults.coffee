Template.searchResults.helpers numberOfVenues: ->
  Meteor.call "getSearchResultsCount", (error, result) ->
    Session.set("numberOfVenues", result)
  Session.get("numberOfVenues")

Template.searchResults.helpers noData: ->
  not Session.get("venues")

Template.searchResults.events "click #export": ->
  csv = Papa.unparse(Session.get("venues"))
  console.log csv
  return