require_relative '../spec_helper'

RSpec.describe "user can see form for creating a new station" do
  it "will display the correct empty form" do
    City.create(name: "Addis")
    city = City.find(1)
    station = city.stations.create(name: "MLK", dock_count: 22, installation_date: "1864-11-12")

    visit('/stations')
    click_on "Create New Station"

    save_and_open_page
    expect(page).to have_content("Create A New Station")
  end
end
