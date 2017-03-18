require_relative "../spec_helper"

RSpec.describe "When a user visits '/trips' " do
  it "they see all the trips" do
    city = City.create(name: "Denver")
    station1 = city.stations.create(name: "Turing", dock_count: 100, installation_date: "3/14/2017")
    station2 = city.stations.create(name: "Galvanize", dock_count: 1, installation_date: "4/01/1972")
    trip1 = Trip.create(duration: 100, start_date: "8/29/2013 14:14", start_station_id: 1, end_date: "8/29/2013 20:14", end_station_id: 2, bike_id: 1, subscription_type: "Subscription", zipcode: 12345)

  visit '/trips'

  within('h1') do
    expect(page).to have_content('All Trips')
  end
  expect(page).to have_content(trip1.duration)
  end
end
