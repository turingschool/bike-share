RSpec.describe "user creates station" do
  it "with valid attributes" do
    visit("/stations/new")
    fill_in("station[name]", with: "fifth")
    fill_in("station[dock_count]", with: 5)
    fill_in("station[installation_date]", with: Time.now)
    fill_in("station[city]", with: "city")

    click_button("Create Station")
    save_and_open_page
    station = Station.last
    expect(current_path).to eq("/stations/#{station.id}")
    expect(page).to have_content("fifth")
  end
end
