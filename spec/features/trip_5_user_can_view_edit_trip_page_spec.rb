require_relative '../spec_helper'

RSpec.describe "when a user visits the edit page" do
  it "displays an edit form" do
    city = City.create(name: "San Jose")
    city.stations.create(name: "MLK Station", dock_count: 19, city_id: 1, installation_date: "2013-5-11")
    city.stations.create(name: "Cesar Chavez Station", dock_count: 5, city_id: 1, installation_date: "2013-5-19")
    start_station = StartStation.create(station_id: 2)
    end_station = EndStation.create(station_id: 1)
    subscription_type = SubscriptionType.create(name: "Customer")
    trip = subscription_type.trips.create(duration: 400,
                              start_station_id: 1,
                              end_station_id: 1,
                              start_date: "2012-8-12",
                              end_date: "2012-8-12",
                              bike_id: 122,
                              zip_code: 80218)

    visit("/trips/1")
    click_on "Edit"

    expect(current_path).to eq("/trips/1/edit")
    expect(page).to have_content("change")
    expect(page).to have_content("Zipcode")
  end
end
