Template.searchResultsList.helpers searchResults: ->
  Session.get("searchResultsData")?.slice(0, 7)
Template.searchResultsList.helpers numberOfVenues: ->
  Session.get("searchResultsData")?.length
Template.searchResultsList.helpers numberOfDisplayingVenues: ->
  Session.get("searchResultsData")?.slice(0, 7).length