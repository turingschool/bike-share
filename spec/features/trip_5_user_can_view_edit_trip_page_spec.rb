require_relative '../spec_helper'

RSpec.describe "when a user visits the edit page" do
  it "displays an edit form" do
    city = City.create(name: "Denver")
    City.create(name: "DC")
    City.create(name: "New York")
    city.stations.create!(name: "MLK", dock_count: 22, installation_date: "2013-11-12")
    customer = Customer.create(name: "Customer")
    customer.trips.create!(duration: 200,
                           start_date: "2000-8-12",
                           start_station_id: 1,
                           end_date: "2000-8-12",
                           end_station_id: 2,
                           bike_id: 13,
                           zip_code: 80220)

    visit("/trips/1")
    click_on "Edit"

    expect(current_path).to eq("/trips/1/edit")
    expect(page).to have_content("change")
    expect(page).to have_content("80220")
  end
end
