describe "User can access edit station page" do
  it "and view form to edit station" do

    station_1 = Station.create(name: "Turing", dock_count: 10, city: "Denver", installation_date: "11/08/17")

    visit '/stations/1/edit'

    page.has_content?(station_1.name)
    page.has_content?(station_1.dock_count)
    page.has_content?(station_1.city)
    page.has_content?(station_1.installation_date)
  end
  it "and edit station" do
    Station.create(name: "Turing", dock_count: 10, city: "Denver", installation_date: "11/08/17")

    visit '/stations/1/edit'

    fill_in("station[name]", with: "Galvanize")
    fill_in("station[dock_count]", with: 10)
    fill_in("station[city]", with: "Denver")
    fill_in("station[installation_date]", with: "08/18/17")
    click_on("Update New Station")

    expect(page).to have_content("Galvanize")
    expect(page).to have_content("10")
    expect(page).to have_content("Denver")
    expect(page).to have_content("08/18/17")
  end
end
