require_relative "../spec_helper"

RSpec.describe "When a user visits '/stations' " do
  it "they see all the bike stations" do
    station1 = Station.create(name: "Turing", dock_count: 100, city: "Denver", installation_date: "3/14/2017")
    station2 = Station.create(name: "Galvanize", dock_count: 1, city: "Denver", installation_date: "4/01/1972")

    visit '/stations'

    within('h1') do
      expect(page).to have_content('All Bike Stations')
    end
    expect(page).to have_content(station1.name)
    expect(page).to have_content(station2.name)
    expect(page).to have_content(station1.dock_count)
    expect(page).to have_content(station2.dock_count)
    expect(page).to have_content(station1.city)
    expect(page).to have_content(station2.city)
    expect(page).to have_content(station1.installation_date)
    expect(page).to have_content(station2.installation_date)
  end
end
