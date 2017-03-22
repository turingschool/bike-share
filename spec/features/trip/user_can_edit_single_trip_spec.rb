#setup
city = City.create(city: "Denver")
start_station = city.stations.create(name: "Downtown", dock_count: 15, city: city, installation_date: "2013-08-05")
end_station = city.stations.create(name: "Caphill", dock_count: 15, city: city, installation_date: "2013-08-05")
zipcode = Zipcode.create(zip_code: 94062)
subscription = Subscription.create(subscription: "Customer")
trip = Trip.create(duration: 32, start_station: start_station, end_station: end_station, bike_id: 1, zipcode: zipcode, subscription: subscription, start_date: "8/29/2013 14:14", end_date: "8/29/2013 14:46")
#when I visit
