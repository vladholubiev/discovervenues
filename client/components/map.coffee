Template.map.helpers mapOptions: ->
  if GoogleMaps.loaded()
    GoogleMaps.ready "mainMap", (map) ->
      return

    center: new google.maps.LatLng(35.573629, 138.877374)
    disableDefaultUI: true
    zoom: 8