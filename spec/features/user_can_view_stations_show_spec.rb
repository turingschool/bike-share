require './app/models/station'

RSpec.describe "User visits '/stations/show/:id'" do
  it "sees specific information for that station" do
    Station.create(name: "Station_1", dock_count: 8, city: "San Fran", installation_date: "8/6/2013")
    Station.create(name: "Station_2", dock_count: 6, city: "San Fran", installation_date: "8/7/2013")

    visit '/stations/1'

    expect(page).to have_content("Station_1")
    expect(page).to_not have_content("Station_2")
  end
end
