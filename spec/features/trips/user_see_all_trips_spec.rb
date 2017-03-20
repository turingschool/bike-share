require_relative "../../spec_helper"

RSpec.describe "When a user visits '/trips' " do
  it "they see all the trips" do
    city = City.create(name: "Denver")
    station1 = city.stations.create(name: "Turing", dock_count: 100, installation_date: "3/14/2017")
    station2 = city.stations.create(name: "Galvanize", dock_count: 1, installation_date: "4/01/1972")
    bike = Bike.create(bike_number: 33)
    subscription_type = SubscriptionType.create(subscription_type: "Subscriber")
    zip_code = ZipCode.create(zip_code: 80602)
    trip1 = bike.trips.create(duration: 100, start_date: "8/29/2013 14:14", start_station_id: station1.id, end_date: "8/29/2013 20:14", end_station_id: station2.id, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
    trip2 = bike.trips.create(duration: 200, start_date: "1/20/2013 10:14", start_station_id: station2.id, end_date: "10/29/2014 12:14", end_station_id: station1.id, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
    visit '/trips'

    within('h1') do
      expect(page).to have_content('All Trips')
    end
    expect(page).to have_content(trip1.duration)
    expect(page).to have_content(trip1.start_date)
    expect(page).to have_content(station1.name)
    expect(page).to have_content(trip1.end_date)
    expect(page).to have_content(station2.name)
    expect(page).to have_content(trip1.bike.bike_number)
    expect(page).to have_content(trip1.subscription_type.subscription_type)
    expect(page).to have_content(trip1.zip_code.zip_code)
    expect(page).to have_content(trip2.duration)

  end
end
