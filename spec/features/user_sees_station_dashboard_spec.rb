RSpec.describe "User visits '/station-dashboard'" do
  before :each do
    Station.create(name: "Mission", dock_count: 30, city_id: 2, installation_date: "1/4/15")
    Station.create(name: "Embarcadero", dock_count: 50, city_id: 2, installation_date: "3/4/16")
    Station.create(name: "Rockridge", dock_count: 15, city_id: 3, installation_date: "5/4/17")
    visit("/stations-dashboard")
    save_and_open_page
  end

  it "and sees total count of stations" do
    expect(page).to have_content("Total Stations: 3")
  end
  it "and sees average bikes per station" do
    expect(page).to have_content("Average Bikes per Station: 32")
  end
  it "and sees most bikes at station" do
    expect(page).to have_content("Most bikes at a Station: 50")
  end
  it "and sees station where most bikes are available" do
    expect(page).to have_content("Stations with Most Bikes: Embarcadero")
  end
  it "and sees fewest bikes available" do
    expect(page).to have_content("Least bikes at Station: 15")
  end
  it "and sees stations where fewest bikes are available" do
    expect(page).to have_content("Stations with Least Bikes: Rockridge")
  end
  it "and sees most recently installed station" do
    expect(page).to have_content("Newest Stations: Rockridge")
  end
  it "and sees oldest station" do
    expect(page).to have_content("Oldest Stations: Mission")
  end
end
