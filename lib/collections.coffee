@PastQueries = new Mongo.Collection("pastQueries")

Meteor.methods searchVenues: (queryObject) ->
  result = null
  foursquare = Meteor.npmRequire("foursquarevenues")
  foursquare = foursquare("POO2XNGBYUAGGPUQNXLJD22YANBVEF5OZ1DXWGCIDAO2K2XU",
    "UXH45MUBUKNQGPABSYCDF2CXTVKUBDXFXZSPZY1CR2JRUELU")

  Async.runSync (done) ->
    foursquare.getVenues queryObject, (error, venues) ->
      unless error
        result = venues.response.venues
      done(null, venues)
      return
    return

  return result
