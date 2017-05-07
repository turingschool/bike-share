require_relative '../spec_helper'

RSpec.describe "user can delete a trip" do
  it "takes you to view all page and entry is deleted" do
    city = City.create(name: "Washington DC")
    City.create(name: "Frankfurt")
    City.create(name: "Tokyo")
    city.stations.create!(name: "MLK", dock_count: 32, installation_date: "1984-05-24")
    city.stations.create!(name: "Malcom X", dock_count: 32, installation_date: "1984-05-24")
    customer = Customer.create(name: "Customer")
    customer.trips.create!(duration: 300,
                           start_date: "2010-9-1",
                           start_station_id: 1,
                           end_date: "2010-9-1",
                           end_station_id: 2,
                           bike_id: 13,
                           zip_code: 80220)
    customer.trips.create!(duration: 200,
                           start_date: "2000-8-12",
                           start_station_id: 1,
                           end_date: "2000-8-12",
                           end_station_id: 2,
                           bike_id: 13,
                           zip_code: 80220)
    visit("/trips/1")

    click_on "Delete"
    expect(current_path).to eq("/trips/view_all")
    expect(page).to_not have_content("300")
  end
end
