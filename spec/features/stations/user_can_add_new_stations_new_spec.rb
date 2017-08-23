RSpec.describe "User creates station" do
  it "with valid attributes" do

    visit '/stations/new'

    fill_in("name", with: "Station_1")
    fill_in("dock_count", with: 10)
    fill_in("city", with: "cityville")
    fill_in("installation_date", with: "2017-10-20 19:20:22")
    click_on("Submit")

    expect(page).to have_content("Station_1")
    expect(page).to have_content("cityville")
  end
end
