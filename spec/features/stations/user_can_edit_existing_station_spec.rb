describe "User can access edit station page" do
  it "and view form to edit station" do

    station_1 = Station.create(name: "Turing", dock_count: 10, city: "Denver", installation_date: "2014-04-09")

    visit '/stations/1/edit'

    expect(page).to have_content("Edit #{station_1.name} Station:")
  end
  it "and edit station" do

    Station.create(name: "Turing", dock_count: 10, city: "Denver", installation_date: "2014-04-09")

    visit '/stations/1/edit'

    fill_in("station[name]", with: "Galvanize")
    fill_in("station[dock_count]", with: 10)
    fill_in("station[city]", with: "Denver")
    fill_in("station[installation_date]", with: "2014-04-09")
    click_on("Update Station")

    expect(page).to have_content("Galvanize")
    expect(page).to have_content("10")
    expect(page).to have_content("Denver")
    expect(page).to have_content("2014-04-09")

    expect(current_path).to eq("/stations/#{Station.last.id}")
  end
end
