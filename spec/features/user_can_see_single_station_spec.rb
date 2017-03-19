require_relative "../spec_helper"

RSpec.describe "when a user visits '/stations/1' " do
  it "they can see a single station" do
    Station.create(name: "Japantown", dock_count: 15, city_id: 1, installation_date: "2013-08-05")
    # As a user
    # When I visit /station/:id
    visit "/stations/1"
    # I expect to be on the /station/:id page
    expect(current_path).to eq("/stations/1")
    # I expect to see station information for a single station
    within("h1") do
      expect(page).to have_content("Station Information")
    end
    # I expect to see station name for a single station
    expect(page).to have_content("Name: Japantown")
    # I expect to see station dock count for a single station
    expect(page).to have_content("Dock Count: 15")
    # I expect to see station city for a single station
    # I expect to see station installation date for a single station
    expect(page).to have_content("Installation Date: 2013-08-05")
  end
end
