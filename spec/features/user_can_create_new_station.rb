require_relative "../spec_helper"

RSpec.describe "when a user visits '/stations/new' " do
  xit "they can create a new station" do

    # As a user
    # When I visit "/stations/new"
    visit "/stations/new"

    # and I fill in name with "San Pedro Square"
    fill_in "station[name]", with: "San Pedro Square"

    # and I fill in dock count with "15"
    fill_in "station[dock_count]", with: "15"
    # and I fill in city with "San Jose"
    fill_in "station[city]", with: "San Jose"

    # and I fill in installation date with "8/7/2013"
    fill_in "station[installation_date]", with: "8/7/2013"

    # and I click "Create Station"
    click_on "Create Station"

    # then I expect to be taken to "/stations"
    expect(current_path).to eq("/stations")

    # and then I expect to see "Station: San Pedro Square"
    # and then I expect to see "Dock Count: 15"
    # and then I expect to see "City: San Jose"
    # and then I expect to see "Installation Date: 8/7/2013"
    within(".station-info") do
      expect(page).to have_content("Station: San Pedro Square")
      expect(page).to have_content("Dock Count: 15")
      expect(page).to have_content("City: San Jose")
      expect(page).to have_content("Installation Date: 8/7/2013")
    end
  end
end
