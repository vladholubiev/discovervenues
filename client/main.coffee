Meteor.call "clearSearchResults"
Meteor.startup ->
  GoogleMaps.load()
  return
