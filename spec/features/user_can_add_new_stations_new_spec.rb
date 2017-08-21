require './app/models/station'

RSpec.describe "User creates station" do
  it "with valid attributes" do

    visit '/stations/new'

    fill_in("name", with: "Station_1")
    fill_in("dock_count", with: 10)
    fill_in("city", with: "cityville")
    fill_in("lattitude", with: "37.329732")
    fill_in("longitude", with: "-121.901782")
    select("06/08/2013", :from => 'installation_date')
    click_on("Submit")

    expect(page).to have_content("Station_1")
  end
end
