RSpec.describe "user visits station dashboard" do
  before do
    @station_a = Station.create(name: "A", dock_count: 2, installation_date_id: 2, city: "Lakewood")
    @station_b = Station.create(name: "B", dock_count: 2, installation_date_id: 1, city: "Denver")
    @station_c = Station.create(name: "C", dock_count: 5, installation_date_id: 3, city: "Littleton")
    @station_d = Station.create(name: "D", dock_count: 4, installation_date_id: 5, city: "Boulder")
    @station_e = Station.create(name: "E", dock_count: 3, installation_date_id: 6, city: "Fort Collins")
    visit("/station-dashboard")
  end
  #as an unauthenticated user
 # When I visit the station dashboard
  it "sees total count of stations" do
   # Then I see total count of stations
  #  save_and_open_page
    expect(page).to have_content("5")
    # within('div.least_bikes_station') do
    #
    # end
  end

  it "sees an average count of bikes available per station" do
   # Then I see an average bikes available per station
    expect(page).to have_content("3")
  end

  it "sees the station(s) where most bikes are available" do
   # Then I see station(s) where the most bikes are available
    expect(page).to have_content(@station_c.name)
  end

  it "sees the fewest bikes at a station data" do
   # Then I see a fewest bikes at station data point
    expect(page).to have_content("2")
  end

  it "sees the stations where the fewest bikes are available" do
   # Then I see the stations where the fewest bikes are available
    expect(page).to satisfy{|page| page.has_content?(@station_a.name) && has_content?(@station_b.name)}
  end

  it "sees the newest station" do
   # Then I see most recently installed station
    expect(page).to have_content(@station_e.name)
  end

  it "sees the oldest station" do
   # Then I see oldest station
    expect(page).to have_content(@station_d.name)
  end
end
