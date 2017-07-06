RSpec.describe "User edits a station" do
  it "with valid attributes" do

    Station.create(name: "Mission", dock_count: 30, city_id: 2, installation_date: "1/4/15")

    visit('/stations/1/edit')

    save_and_open_page

    fill_in("station[name]", with: "Embarcadero")
    fill_in("station[dock_count]", with: 50)
    fill_in("station[installation_date]", with: "2016-03-04")

    name       = find_field("station[name]").value
    dock_count = find_field("station[dock_count]").value.to_i
    installed  = find_field("station[installation_date]").value

    expect(name).to eq("Embarcadero")
    expect(dock_count).to eq(50)
    expect(installed).to eq("2016-03-04")

    click_button("Submit Changes")

    save_and_open_page

    expect(current_path).to eq("/stations")
    expect(page).to have_content("Embarcadero")
    expect(page).to have_content("Dock count: 50")
    expect(page).to have_content("2016-03-04")
  end
end
