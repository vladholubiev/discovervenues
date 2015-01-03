Template.searchResults.helpers numberOfVenues: ->
  Meteor.call "getSearchResultsCount", (error, result) ->
    Session.set("numberOfVenues", result)
  Session.get("numberOfVenues")

Template.searchResults.helpers noData: ->
  if Session.get("venues") is undefined and Session.get("noResults") is undefined
    return yes
  else
    if Session.get("venues") is undefined
      Session.get("noResults")
    else Session.get("venues").length < 1

Template.searchResults.events "click #export": ->
  csv = Papa.unparse(Session.get("venues"))
  base64Csv = btoa(unescape(encodeURIComponent(csv)))
  blob = base64ToBlob(base64Csv)
  saveAs(blob, 'search-results.csv')
  return

base64ToBlob = (base64String) ->
  byteCharacters = atob(base64String)
  byteNumbers    = new Array(byteCharacters.length)
  i              = 0
  while i < byteCharacters.length
    byteNumbers[i] = byteCharacters.charCodeAt(i)
    i++
  byteArray = new Uint8Array(byteNumbers)
  return blob = new Blob([byteArray],
    type: "zip"
  )