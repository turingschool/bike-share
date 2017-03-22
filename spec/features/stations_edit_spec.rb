require_relative '../spec_helper'

RSpec.describe "when a user visits /stations/:id/edit" do
  it "they can edit that station" do
    City.create(name:"San Jose")
    Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
    Bike.create(bike_number: 23)
    Bike.create(bike_number: 25)
    ZipCode.create(zip_code: 80210)
    Trip.create(duration: 60, start_date: "24/9/2014", start_station_id: 1, end_date: "23/9/2014", end_station_id: 2, bike_id: 1, subscription_type_id: 1, zip_code_id: 1)
    Trip.create(duration: 40, start_date: "23/9/2014", start_station_id: 1, end_date: "23/9/2014", end_station_id: 1, bike_id: 2, subscription_type_id: 1, zip_code_id: 1)
    Trip.create(duration: 40, start_date: "23/9/2014", start_station_id: 2, end_date: "23/9/2014", end_station_id: 2, bike_id: 2, subscription_type_id: 1, zip_code_id: 1)
    visit "stations/1/edit"
    fill_in "station[dock_count]", with: 10
    click_on "submit"

    expect(current_path).to eq("/stations/1")

    expect(page).to have_content("Bike Capacity: 10")
  end
end