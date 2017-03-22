require_relative "../../spec_helper"

RSpec.describe "when a user visits the page to create a new station" do
  it "they can create a new station" do
    # station = Station.create(name: "Japantown", dock_count: 15, city_id: 1, installation_date: "2013-08-05")
    # city = City.create(city: "San Jose")
    # As a user
    # When I visit "/stations/new"
    visit "/stations/new"

    # and I fill in name with "San Pedro Square"
    fill_in "station[name]", with: "Japantown"

    # and I fill in dock count with "15"
    fill_in "station[dock_count]", with: "15"
    # and I fill in city with "San Jose"
    fill_in "station[city]", with: "San Jose"

    # and I fill in installation date with "8/7/2013"
    fill_in "station[installation_date]", with: "2013-08-05"

    # and I click "Create Station"
    click_on "Create Station"

    # then I expect to be taken to "/stations"
    expect(current_path).to eq("/stations")

    # and then I expect to see "Station: San Pedro Square"
    # and then I expect to see "Dock Count: 15"
    # and then I expect to see "City: San Jose"
    # and then I expect to see "Installation Date: 8/7/2013"
    within(".all-stations-info") do
      expect(page).to have_content("Japantown")
      expect(page).to have_content("15")
      expect(page).to have_content("San Jose")
      expect(page).to have_content("2013-08-05")
    end
  end
end
