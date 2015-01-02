@Pages = new Meteor.Pagination SearchResults,
  perPage: 5
  fastRender: true
  itemTemplate: "searchResult"
  table:
    class: "table table-hover table-striped table-borderless"
    fields: ["name", "city", "address", "lat", "lon"]
    header: ["Name", "City", "Street Address", "Latitude", "Longitude"]