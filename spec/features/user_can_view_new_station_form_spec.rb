require_relative '../spec_helper'

RSpec.describe "user can see form for creating a new station" do
  it "will display the correct empty form" do
    City.create(name: "Addis")
    city = City.find(1)
    station = city.stations.create(name: "MLK", dock_count: 22, installation_date: "7/12/1864")

    visit('/stations')
    click_on "Create New Station"

    expect(page).to have_content("Submit")
    save_and_open_page
  end
end
