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
    user: Meteor.userId()
    query: $(e.target).find("input").val()

  Meteor.call "storePastQuery", queryObject, (error, result) ->
    return

  Meteor.call "searchVenues", queryObject, (error, result) ->
    venues = _.map result, (venue) ->
      parseVenueJson venue

    Session.set("noResults", true) if error or result.length < 1
    Session.set("venues", venues)

    Meteor.call "clearSearchResults"

    _.map venues, (venue) ->
      SearchResults.insert venue
    return
  return

createLatLonString = ->
  GoogleMaps.maps.mainMap.instance.center.k + "," + GoogleMaps.maps.mainMap.instance.center.D

# Approximate radius based on location and zoom level
getRadius = ->
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