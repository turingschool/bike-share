require_relative '../spec_helper'

RSpec.describe "user can delete a trip" do
  it "takes you to view all page and entry is deleted" do
    city = City.create(name: "San Jose")
    city.stations.create(name: "MLK Station", dock_count: 19, city_id: 1, installation_date: "2013-5-11")
    city.stations.create(name: "Cesar Chavez Station", dock_count: 5, city_id: 1, installation_date: "2013-5-19")
    StartStation.create(station_id: 2)
    StartStation.create(station_id: 1)
    EndStation.create(station_id: 2)
    EndStation.create(station_id: 1)
    SubscriptionType.create(name: "Subscriber")
    subscription_type = SubscriptionType.create(name: "Customer")
    trip = subscription_type.trips.create(duration: 400,
                              start_station_id: 1,
                              end_station_id: 2,
                              start_date: "2012-8-12",
                              end_date: "2012-8-12",
                              bike_id: 122,
                              zip_code: 80218)
    visit("/trips/1")

    click_on "Delete"
    expect(current_path).to eq("/trips/view_all")
    expect(page).to_not have_content("300")
  end
end
