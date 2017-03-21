require_relative "../../spec_helper"

RSpec.describe "When a user visits '/stations' " do
  it "they see all the bike stations" do
    city = City.create(name: "Denver")
    station1 = city.stations.create(name: "Turing", dock_count: 100, installation_date: "14/3/2017")
    station2 = city.stations.create(name: "Galvanize", dock_count: 1, installation_date: "1/4/1972")

    visit '/stations'

    within('h1') do
      expect(page).to have_content('All Bike Stations')
    end
    expect(page).to have_content(station1.name)
    expect(page).to have_content(station2.name)
    expect(page).to have_content(station1.dock_count)
    expect(page).to have_content(station2.dock_count)
    expect(page).to have_content(station1.city.name)
    expect(page).to have_content(station2.city.name)
    expect(page).to have_content(station1.installation_date.strftime("%B %d, %Y"))
    expect(page).to have_content(station2.installation_date.strftime("%B %d, %Y"))
  end
end
