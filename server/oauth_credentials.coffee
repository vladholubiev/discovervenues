if not ServiceConfiguration.configurations.findOne(service: "google")
  ServiceConfiguration.configurations.insert
    service: 'google'
    clientId: '793024068301-f4oaj5u1r7qinsf0olv5uhh7arhc1erm.apps.googleusercontent.com'
    secret: 'bBOwCBOhayQ-38m7RjHLYZ0W'
