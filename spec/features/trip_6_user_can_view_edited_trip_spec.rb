require_relative '../spec_helper'

RSpec.describe "user can fill in form" do
  it "it updates page with correct information" do
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


      visit('/trips/1/edit')
      fill_in "trip[duration]", with: 300
      select("Cesar Chavez Station", :from => "trip[end_station_id]")
      select("Cesar Chavez Station", :from => "trip[start_station_id]")
      fill_in "trip[bike_id]", with: 13
      fill_in "trip[zip_code]", with: 80218
      click_button "Submit changes"
      expect(current_path).to eq('/trips/1')
      expect(page).to have_content("Cesar Chavez Station")
      expect(page).to have_content("13")
  end
end
