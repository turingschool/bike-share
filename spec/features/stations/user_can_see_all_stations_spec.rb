describe "User visits stations" do
  it "and can see all stations" do
    station_1 = Station.create(name: "Turing", dock_count: 10, city: "Denver", installation_date: "11/08/17")
    station_2 = Station.create(name: "UCLA", dock_count: 10, city: "Los Angeles", installation_date: "11/09/17")

    visit '/stations'

    expect(page).to have_content(station_1.name)
    expect(page).to have_content(station_2.name)
  end
end
