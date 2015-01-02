Template.searchBox.helpers notUser: ->
  not Meteor.user()

Template.searchBox.events "submit form": (e) ->
  e.preventDefault()
  return if not Meteor.user()

  queryObject =
    ll: createLatLonString()
    query: $(e.target).find("input").val()

  console.log queryObject

  Meteor.call "searchVenues", queryObject, (error, result) ->
    console.log result

    alert(error.reason) if error
    return
  return

createLatLonString = ->
  GoogleMaps.maps.mainMap.options.center.lat() + "," + GoogleMaps.maps.mainMap.options.center.lng()