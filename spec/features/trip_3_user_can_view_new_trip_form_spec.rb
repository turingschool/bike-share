require_relative '../spec_helper'

RSpec.describe "user can see form for creating a new trip" do
  it "will display the correct empty form" do
    city = City.create(name: "San Jose")
    city.stations.create(name: "MLK Station", dock_count: 19, city_id: 1, installation_date: "2013-5-11")
    city.stations.create(name: "Cesar Chavez Station", dock_count: 5, city_id: 1, installation_date: "2013-5-19")
    start_station = StartStation.create(station_id: 2)
    end_station = EndStation.create(station_id: 1)
    subscription_type = SubscriptionType.create(name: "Customer")
    ride_date = RideDate.find_or_create_by(day: 12, month: 8, year: 2012)
    trip = subscription_type.trips.create(duration: 400,
                              start_station_id: 1,
                              end_station_id: 1,
                              start_date: ride_date,
                              end_date: ride_date,
                              bike_id: 122,
                              zip_code: 80218)

    visit('/trips')
    click_on "Create New Trip"

    expect(page).to have_content("Create A New Trip")
  end
end
