require './app/models/station'


RSpec.describe "User visits '/station_dashboard'" do
  it "sees total count of stations" do
    Station.create(name: "Station_1", dock_count: 8, city: "San Fran", installation_date: "8/6/2013")
    Station.create(name: "Station_2", dock_count: 6, city: "San Fran", installation_date: "8/7/2013")

    expect(page).to have_content("2")
  end

  it "returns average bikes available per station" do
    Station.create(name: "Station_1", dock_count: 8, city: "San Fran", installation_date: "8/6/2013")
    Station.create(name: "Station_2", dock_count: 6, city: "San Fran", installation_date: "8/7/2013")

    expect(page).to have_content("7")
  end

  it "returns most bikes available at a station" do
    Station.create(name: "Station_1", dock_count: 8, city: "San Fran", installation_date: "8/6/2013")
    Station.create(name: "Station_2", dock_count: 6, city: "San Fran", installation_date: "8/7/2013")

    expect(page).to have_content("8")
  end
end
