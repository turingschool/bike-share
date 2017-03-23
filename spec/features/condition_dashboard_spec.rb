require_relative '../spec_helper'

RSpec.describe "when a user visits /stations-dashboard" do
  it "they can see dashboard metrics" do
    City.create(name:"San Jose")
    Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
    Station.create(name: "Penn Station", dock_count: 10, installation_date: "17/5/2016", city_id: 1)
    Station.create(name: "Grand Central Station", dock_count: 12, installation_date: "19/5/2016", city_id: 1)
    visit "/stations-dashboard"

    expect(page).to have_content("Total number of stations: 3")
    expect(page).to have_content("Average bikes available per station: 11.3")
    expect(page).to have_content("Most bikes available at a station: 12")
    expect(page).to have_content("Station(s) where the most bikes are available: Union Station, Grand Central Station")
    expect(page).to have_content("Fewest bikes available at a station: 10")
    expect(page).to have_content("Station(s) where the fewest bikes are available: Penn Station")
    expect(page).to have_content("Newest station: Grand Central Station")
    expect(page).to have_content("Oldest station: Union Station")

  end
end