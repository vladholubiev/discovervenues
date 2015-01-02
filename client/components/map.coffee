markers = []

Template.map.helpers mapOptions: ->
  if GoogleMaps.loaded()
    GoogleMaps.ready "mainMap", (map) ->
      return

    center: new google.maps.LatLng(35.573629, 138.877374)
    disableDefaultUI: true
    zoom: 8

placeNewMarkers = (venuesList) ->
  _.each venuesList, (el, index) ->
    latLon = new google.maps.LatLng(el.lat, el.lon)
    marker = new google.maps.Marker(
      position: latLon
      map: GoogleMaps.maps.mainMap.instance
    )
    markers.push marker
    return
  return

removeOldMarkers = ->
  _.each markers, (el, index) ->
    el.setMap null
    return
  return

Template.searchBox.events "submit form": (e) ->
  e.preventDefault()
  removeOldMarkers()
  return

Tracker.autorun ->
  placeNewMarkers(Session.get("venues"))
  return