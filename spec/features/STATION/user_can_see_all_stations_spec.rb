RSpec.describe "user can see all stations" do
  it "when visiting stations index" do
    station = Station.create(name: "Turing", city: "Hell", installation_date: "1969/4/20", dock_count: 69)
    station_2 = Station.create(name: "Harvard", city: "Pretention Central", installation_date: "1666/6/6", dock_count: 13)

    visit '/stations'

    expect(page).to have_content("Turing")
    expect(page).to have_content("Harvard")
    expect(Station.count).to eq(2)
  end
end
