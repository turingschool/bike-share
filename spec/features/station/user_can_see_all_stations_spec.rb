require_relative "../../spec_helper"

RSpec.describe "when a user visits '/stations' " do
  it "they can see all stations" do
    city = City.create(city: "Denver")
    station = city.stations.create(name: "Japantown", dock_count: 15, city_id: 1, installation_date: "2013-08-05")

    # As a user
    # When I vist /stations
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
    # (how the F do we do this with the city table etc)
    # I expect to see content station installation date
    expect(page).to have_content("Installation Date: 2013-08-05")


  end
end
