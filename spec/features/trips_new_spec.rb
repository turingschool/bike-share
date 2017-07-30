require_relative '../spec_helper'

RSpec.describe "when a user visits /trips/new" do
  it "they can create a new trip" do
    Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/16", city_id: 1)
    Bike.create(bike_number: 23)
    visit "trips/new"
    fill_in "trip[duration]", with: 60
    fill_in "trip[start_date]", with: "15/5/16"
    fill_in "trip[start_station_id]", with: 1
    fill_in "trip[end_date]", with: "15/5/16"
    fill_in "trip[end_station_id]", with: 1
    fill_in "trip[bike_id]", with: 1
    fill_in "trip[subscription_type_id]", with: 1
    fill_in "trip[zip_code_id]", with: 1
    click_on "Submit"

    expect(current_path).to eq("/trips")

    within("table") do
      expect(page).to have_content("1")
    end
  end
end