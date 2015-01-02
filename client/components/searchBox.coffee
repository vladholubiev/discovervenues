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
    query: $(e.target).find("input").val()

  Meteor.call "searchVenues", queryObject, (error, result) ->
    for venue in result
      venues.push
        name: venue.name
        city: venue.location.city
        address: venue.location.address
        lat: venue.location.lat
        lon: venue.location.lng
    Session.set("noResults", result.length < 1)
    Session.set("noResults", error) if error
    Session.set("searchResultsData", venues)
    console.log venues
  return
  return

createLatLonString = ->
  GoogleMaps.maps.mainMap.options.center.lat() + "," + GoogleMaps.maps.mainMap.options.center.lng()