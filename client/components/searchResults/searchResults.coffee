Template.searchResults.helpers numberOfVenues: ->
  Meteor.call "getSearchResultsCount", (error, result) ->
    Session.set("numberOfVenues", result)
  Session.get("numberOfVenues")