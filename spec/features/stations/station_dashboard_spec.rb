require './app/models/station'


RSpec.describe "User visits '/stations-dashboard'" do
  it "sees total count of stations" do
    Station.create(name: "Station_1", dock_count: 8, city: "San Fran", installation_date: "8/6/2013")
    Station.create(name: "Station_2", dock_count: 6, city: "San Fran", installation_date: "8/7/2013")

    visit '/stations-dashboard'

    expect(page).to have_content("2")
  end

  it "returns average bikes available per station" do
    Station.create(name: "Station_1", dock_count: 8, city: "San Fran", installation_date: "8/6/2013")
    Station.create(name: "Station_2", dock_count: 6, city: "San Fran", installation_date: "8/7/2013")

    visit '/stations-dashboard'

    expect(page).to have_content("7")
  end

  it "returns most bikes available at a station" do
    Station.create(name: "Station_1", dock_count: 8, city: "San Fran", installation_date: "8/6/2013")
    Station.create(name: "Station_2", dock_count: 6, city: "San Fran", installation_date: "8/7/2013")

    visit '/stations-dashboard'

    expect(page).to have_content("8")
  end

  it "returns station with the most bikes" do
    Station.create(name: "Station_1", dock_count: 8, city: "San Fran", installation_date: "8/6/2013")
    Station.create(name: "Station_2", dock_count: 6, city: "San Diego", installation_date: "8/7/2013")

    visit '/stations-dashboard'

    expect(page).to have_content("Station_1")
  end

  it "returns least bikes available at a station" do
    Station.create(name: "Station_1", dock_count: 8, city: "San Fran", installation_date: "8/6/2013")
    Station.create(name: "Station_2", dock_count: 6, city: "San Fran", installation_date: "8/7/2013")

    visit '/stations-dashboard'

    expect(page).to have_content("6")
  end

  it "returns station with the fewest bikes" do
    Station.create(name: "Station_1", dock_count: 8, city: "San Fran", installation_date: "8/6/2013")
    Station.create(name: "Station_2", dock_count: 6, city: "San Diego", installation_date: "8/7/2013")

    visit '/stations-dashboard'

    expect(page).to have_content("Station_2")
  end

  it "returns most recently installed station" do
    Station.create(name: "Station_1", dock_count: 8, city: "San Fran", installation_date: "8/6/2013")
    Station.create(name: "Station_2", dock_count: 6, city: "San Diego", installation_date: "8/7/2013")

    visit '/stations-dashboard'

    expect(page).to have_content("Station_2")
  end

  it "returns oldest station" do
    Station.create(name: "Station_1", dock_count: 8, city: "San Fran", installation_date: "8/6/2013")
    Station.create(name: "Station_2", dock_count: 6, city: "San Diego", installation_date: "8/7/2013")

    visit '/stations-dashboard'

    expect(page).to have_content("Station_1")
  end
end
