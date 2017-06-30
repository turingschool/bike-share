require './spec/spec_helper'

RSpec.describe "When a user visit the stations dashboard (/stations-dashboard)" do
  before {
    city = City.create(name: "squeevillia")
    Station.create(
                  name: "something",
                  dock_count: 1,
                  city_id: city.id,
                  installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                  longitude: 1.1,
                  latitude: -1.1
    )
    Station.create(
                  name: "something else",
                  dock_count: 3,
                  city_id: city.id,
                  installation_date: Date.strptime("08/30/2015",'%m/%d/%Y'),
                  longitude: 1,
                  latitude: -2
    )
  }
  it "loads the appropriate descriptions" do
    visit('/stations-dashboard')

    expect(page).to have_content("Total Stations: 2")
    expect(page).to have_content("Average Bikes per Station: 2")
    expect(page).to have_content("Most Bikes Available at a Station: 3")
    expect(page).to have_content("Most Bikes Available at: something else")
    expect(page).to have_content("Fewest Bikes Available at a Station: 1")
    expect(page).to have_content("Fewest Bikes Available at: something")
    expect(page).to have_content("Newest Station: something else")
    expect(page).to have_content("Oldest Station: something")
  end
end
