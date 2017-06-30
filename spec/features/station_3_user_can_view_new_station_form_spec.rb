require_relative '../spec_helper'

RSpec.describe "user can see form for creating a new station" do
  it "will display the correct empty form" do
    city = City.create(name: "Addis")
    city.stations.create(name: "MLK", dock_count: 22, installation_date: "1864-11-12")

    visit('/stations')
    click_on "Create New Station"

    expect(page).to have_content("Create A New Station")
  end
end
