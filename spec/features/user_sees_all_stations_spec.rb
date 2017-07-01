RSpec.describe "user visits stations index" do
  it "and they see list of all the stations" do
    date = "8/6/2013"
    station_a = Station.create(name: "A", dock_count: 1, installation_date: date, city: "Chicago")
    station_b = Station.create(name: "B", dock_count: 2, installation_date: date, city: "Denver")
    station_c = Station.create(name: "C", dock_count: 3, installation_date: date, city: "Littleton")

    visit("/stations")
    save_and_open_page
    expect(page).to have_content(station_a.name)
    expect(page).to have_content(station_b.dock_count)
    expect(page).to have_content(station_c.city)
    expect(page).to have_content(station_c.installation_date)
  end
end
