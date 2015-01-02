Template.searchResults.helpers numberOfVenues: ->
  Meteor.call "getSearchResultsCount", (error, result) ->
    Session.set("numberOfVenues", result)
  Session.get("numberOfVenues")

Template.searchResults.helpers noData: ->
  not Session.get("venues")

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