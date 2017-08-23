require './app/models/station'

RSpec.describe "User visits '/stations/show/:id'" do
  it "sees specific information for that station" do
    Station.create(name: "Station_1", dock_count: 8, city: "Banana Town", installation_date: "2017-08-20 19:20:22")
    Station.create(name: "Station_2", dock_count: 6, city: "San Fran", installation_date: "2017-10-20 19:20:22")

    visit '/stations/1'

    expect(page).to have_content("Station_1")
    expect(page).to have_content("8")
    expect(page).to have_content("Banana Town")
    expect(page).to have_content("2017-08-20")

    expect(page).to_not have_content("Station_2")
  end
end
