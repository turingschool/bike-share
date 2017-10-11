require "spec_helper"

RSpec.describe "when a user visits '/station-dashboard'" do
  it "they can see dashboard metrics" do

    Station.create(name: "Station 2", dock_count: 13, city: "Denver", installation_date: Date.new(2015, 12, 8), lat: 2.2, long: 3.3)
    Station.create(name: "Station 1", dock_count: 15, city: "Boston", installation_date: Date.new(2015, 10, 8), lat: 2.2, long: 3.3)
    visit "/station-dashboard"


    expect(page).to have_content("2")
    expect(page).to have_content("14")
    expect(page).to have_content("Station 2")

  end
end
