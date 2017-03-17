require_relative "../spec_helper"

RSpec.describe "when a user visits '/stations' " do
  it "they can see all stations" do
    # As a user
    # When I visti /stations
    visit "/stations"
    # I expect to be on /stations page
    expect(current_path).to eq("/stations")
    #I expect to see a list of all bike share stations
    within("h1") do
      expect(page).to have_content("All Bike Stations")
    end

    # I expect to see content station name
    expect(page).to have_content("Name: Japantown")
    # I expect to see content station dock count
    expect(page).to have_content("Dock Count: 15")
    # I expect to see content station city
    expect(page).to have_content("City: San Jose")
    # I expect to see content station installation date
    expect(page).to have_content("Installation Date: 8/05/13")


  end
end
