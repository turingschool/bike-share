RSpec.describe "User creates a station" do
  it "with valid attributes" do

    visit('/stations/new')
    fill_in("station[name]", with: "Santa Clara at Almaden")
    fill_in("station[dock_count]", with: 11)
    fill_in("station[installation_date]", with: "2013-06-08")
    fill_in("station[city_id]", with: 1)

    click_button("Create Station")

    save_and_open_page

    expect(current_path).to eq("/stations")
    expect(page).to have_content("Santa Clara at Almaden")
    expect(page).to have_content("Dock count: 11")
    expect(page).to have_content("Installation Date: 2013-06-08")
    # expect(page).to have_content("City: San Diego")
  end
end
