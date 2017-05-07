require_relative '../spec_helper'

RSpec.describe "when user visits station dashboard" do
  it "displays all relevant stats" do
    city = City.create(name: "Redwood City")
    city.stations.create(name: "MLK", dock_count: 30, installation_date: "1864-8-9")
    city.stations.create(name: "Milk", dock_count: 30, installation_date: "2012-4-12")
    city.stations.create(name: "OJ", dock_count: 9, installation_date: "2012-2-16")
    city.stations.create(name: "PBJ", dock_count: 20, installation_date: "2222-8-24")
    city.stations.create(name: "Simpson", dock_count: 1, installation_date: "2222-8-23")

    visit('/station-dashboard')
    expect(page).to have_content("Station Statistics")
    expect(page).to have_content("Total count of stations")
    expect(page).to have_content("Average bikes available per station")
    expect(page).to have_content("Most bikes available at a station")
    expect(page).to have_content("Station(s) where the most bikes are available")
    expect(page).to have_content("Fewest bikes available at a station")
    expect(page).to have_content("Station(s) where the fewest bikes are available")
    expect(page).to have_content("Most recently installed station")
    expect(page).to have_content("Oldest station")
  end
end
