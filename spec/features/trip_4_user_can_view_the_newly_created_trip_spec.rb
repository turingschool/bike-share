require_relative '../spec_helper'

RSpec.describe "user can click the submit button on a form" do
  it "will redirect to the page for that individual trip" do
    city = City.create(name: "San Jose")
    city.stations.create(name: "MLK Station", dock_count: 19, city_id: 1, installation_date: "2013-5-11")
    city.stations.create(name: "Cesar Chavez Station", dock_count: 5, city_id: 1, installation_date: "2013-5-19")
    StartStation.create(station_id: 2)
    StartStation.create(station_id: 1)
    EndStation.create(station_id: 2)
    EndStation.create(station_id: 1)
    SubscriptionType.create(name: "Subscriber")
    SubscriptionType.create(name: "Customer")

    visit('/trips/new')
    fill_in "trip[duration]", with: 300
    fill_in "trip[start_date_id]", with: "2013-5-11"
    fill_in "trip[end_date_id]", with: "2013-5-11"
    select("Cesar Chavez Station", :from => "trip[end_station_id]")
    select("MLK Station", :from => "trip[start_station_id]")
    fill_in "trip[bike_id]", with: 13
    fill_in "trip[zip_code]", with: 80218
    select("Customer", :from => "subscription_type[name]")

    click_on "Submit"

    expect(current_path).to eq("/trips/1")
    expect(page).to have_content("Cesar Chavez Station")
    expect(page).to have_content("MLK Station")
  end
end
