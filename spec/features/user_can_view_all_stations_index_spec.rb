require './app/models/station'

RSpec.describe "User visits '/stations'" do
  it "sees information on all stations" do
    Station.create(name: "Station_1", dock_count: 8, city: "Banana Town", installation_date: "2017-08-20 19:20:22")
    Station.create(name: "Station_2", dock_count: 6, city: "RockVille", installation_date: "2017-11-20 19:20:22")
    Station.create(name: "Station_3", dock_count: 4, city: "GlueFactoryville", installation_date: "2017-12-20 19:20:22")
    Station.create(name: "Station_4", dock_count: 20, city: "Pants Town", installation_date: "2017-13-20 19:20:22")

    visit '/stations'

    expect(page).to have_content("Station_1")
    expect(page).to have_content("Banana Town")
    expect(page).to have_content("Station_2")
    expect(page).to have_content("RockVille")
    expect(page).to have_content("Station_3")
    expect(page).to have_content("GlueFactoryville")
    expect(page).to have_content("Station_4")
    expect(page).to have_content("Pants Town")
    
  end
end
