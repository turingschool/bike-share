require_relative '../spec_helper'

RSpec.describe "when a user visits /stations/:id/edit" do
  it "they can edit that station" do
    City.create(name:"San Jose")
    Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
    visit "stations/1/edit"
    fill_in "station[dock_count]", with: 10
    click_on "submit"

    expect(current_path).to eq("/stations/1")

    expect(page).to have_content("Bike Capacity: 10")
  end
end