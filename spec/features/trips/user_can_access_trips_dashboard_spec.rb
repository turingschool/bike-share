require './spec/spec_helper'

RSpec.describe "When a user visits the trips dashboard (/trips-dashboard)" do
  before do
    city_1 = City.create(name: "squeevillia")
    Station.create(
                  name: "something",
                  dock_count: 1,
                  city_id: 1,
                  installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                  longitude: 1.1,
                  latitude: -1.1
    )
    Station.create(
                  name: "something else",
                  dock_count: 3,
                  city_id: 1,
                  installation_date: Date.strptime("08/30/2015",'%m/%d/%Y'),
                  longitude: 1,
                  latitude: -2
    )
    Station.create(
                  name: "awesome",
                  dock_count: 3,
                  city_id: 1,
                  installation_date: Date.strptime("08/30/2014",'%m/%d/%Y'),
                  longitude: 2,
                  latitude: -2
    )
    Trip.create(
                duration: 63,
                start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                start_station_id: 1,
                end_date: DateTime.strptime("08/30/2013 11:12", "%m/%d/%Y %H:%M"),
                end_station_id: 1,
                bike_id: 1,
                subscription_type: "Subscriber",
                zipcode_id: 1
    )
    Trip.create(
                duration: 70,
                start_date: DateTime.strptime("05/29/2014 12:42", "%m/%d/%Y %H:%M"),
                start_station_id: 2,
                end_date: DateTime.strptime("05/29/2014 12:43", "%m/%d/%Y %H:%M"),
                end_station_id: 2,
                bike_id: 2,
                subscription_type: "Customer",
                zipcode_id: 2
    )
    Trip.create(
                duration: 71,
                start_date: DateTime.strptime("01/01/2015 10:16", "%m/%d/%Y %H:%M"),
                start_station_id: 1,
                end_date: DateTime.strptime("01/01/2015 10:17", "%m/%d/%Y %H:%M"),
                end_station_id: 2,
                bike_id: 1,
                subscription_type: "Subscriber",
                zipcode_id: 3
    )
  end

  it "loads the appropriate descriptions and calculations" do
    visit('/trips-dashboard')

    expect(page).to have_content("Average Duration of a Ride: 68 seconds")
    expect(page).to have_content("Longest Ride: 71 seconds")
    expect(page).to have_content("Shortest Ride: 63 seconds")
    expect(page).to have_content("Starting Station With the Most Rides: something")
    expect(page).to have_content("Ending Station With the Most Rides: something else")
    expect(page).to have_content("August 2013: 1")
    expect(page).to have_content("May 2014: 1")
    expect(page).to have_content("January 2015: 1")
    expect(page).to have_content("Most Ridden Bike: 1")
    expect(page).to have_content("Total Number of Rides: 2")
    expect(page).to have_content("Least Ridden Bike: 2")
    expect(page).to have_content("Total Number of Rides: 1")
    expect(page).to have_content("Number of Subscribers: 2")
    expect(page).to have_content("Percent of Subscribers: 66.67%")
    expect(page).to have_content("Number of Customers: 1")
    expect(page).to have_content("Percent of Customers: 33.33%")
    expect(page).to have_content("Date With Highest Number of Trips: 08/30/2013: 1")
    expect(page).to have_content("Date With Lowest Number of Trips: 08/30/2013: 1")
  end
end
