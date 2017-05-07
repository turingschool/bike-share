require_relative '../spec_helper'

#As a user when I am on the additional info page
# and click on the edit link
# I expect to be redirected to an edit page
# and see a form to edit station info

RSpec.describe "when a user visits the edit page" do
  it "displays an edit form" do
    city = City.create(name: "Denver")
    City.create(name: "DC")
    City.create(name: "New York")
    city.stations.create!(name: "MLK", dock_count: 22, installation_date: "2013-11-12")

    visit("/stations/1")
    click_on "Edit"
    
    expect(current_path).to eq("/stations/1/edit")
    expect(page).to have_content("change")
    expect(page).to have_content("MLK")
  end
end
