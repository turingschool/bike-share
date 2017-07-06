RSpec.describe "User visits individual station" do
  it "sees individual station" do
    # As a user
    # When I visit the first station's page
    city = City.create(city: "San Jose")
    station = Station.create(name: "San Jose Diridon Caltrain Station",
                       dock_count: 27,
                           city_id: 1,
                 installation_date: "2013-06-08")

    visit "/stations/#{station.id}"


    # I should see a station name , dock_count, city_id, installation_date
    expect(current_path).to eq("/stations/#{station.id}")
    expect(page).to have_content("San Jose Diridon Caltrain Station")
    expect(page).to have_content("27")
    expect(page).to have_content("1")
    expect(page).to have_content("2013-06-08")
  end

end
