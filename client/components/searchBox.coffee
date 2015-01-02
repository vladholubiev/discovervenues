Template.searchBox.helpers isNotUser: ->
  not Meteor.user()

Template.searchBox.helpers invalidQuery: ->
  Session.get("noResults")

Template.searchBox.events "submit form": (e) ->
  e.preventDefault()
  return if not Meteor.user()

  venues = []
  queryObject =
    ll: createLatLonString()
    intent: "browse"
    radius: getRadius()
    query: $(e.target).find("input").val()

  Meteor.call "storePastQuery", queryObject, (error, result) ->
    return

  Meteor.call "searchVenues", queryObject, (error, result) ->
    venues = _.map result, (venue) ->
      parseVenueJson venue

    Session.set("noResults", result.length < 1)
    Session.set("noResults", error) if error
    Session.set("searchResultsData", venues)

    Meteor.call "clearSearchResults"

    _.map venues, (venue) ->
      SearchResults.insert venue
    return
  return

createLatLonString = ->
  GoogleMaps.maps.mainMap.instance.center.k + "," + GoogleMaps.maps.mainMap.instance.center.D

# Approximate radius based on location and zoom level
getRadius = ->
  ###
  zoom level - diameter of a spherical cap
  10         - 160 000 m
  11         -  80 000 m
  12         -  40 000 m
  13         -  20 000 m
  14         -  10 000 m
  15         -   5 000 m
  16         -   2 500 m
  17         -   1 250 m
  18         -     625 m
  19         -     312 m
  20         -     156 m
  21         -      78 m
  ###

  radius = 80000 # maximum radius
  zoom = getZoom()
  if zoom > 10
    for num in [1..(zoom - 10)]
      radius = radius / 2
  return radius

getZoom = ->
  GoogleMaps.maps.mainMap.instance.zoom

parseVenueJson = (rawVenue) ->
  name: rawVenue.name
  city: rawVenue.location.city
  address: rawVenue.location.address
  lat: rawVenue.location.lat.toFixed(4)
  lon: rawVenue.location.lng.toFixed(4)