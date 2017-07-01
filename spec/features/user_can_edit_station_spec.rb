RSpec.describe "user edits station" do
  it "with valid attributes" do
    date = "8/6/2013"
    station_a = Station.create(name: "A", dock_count: 1, installation_date: date, city: "Chicago")
    station_b = Station.create(name: "B", dock_count: 2, installation_date: date, city: "Denver")
    station_c = Station.create(name: "C", dock_count: 3, installation_date: date, city: "Littleton")

    visit("/stations/3/edit")
    fill_in("station[name]", with: "test_station")
    fill_in("station[dock_count]", with: 500)
    fill_in("station[installation_date]", with: Time.now)
    fill_in("station[city]", with: "new_city")

    click_button("Edit Station")
    save_and_open_page
    station = Station.last
    expect(current_path).to eq("/stations/#{station.id}")
    expect(page).to have_content("new_city")
  end
end
