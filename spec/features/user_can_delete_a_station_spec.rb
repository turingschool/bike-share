require_relative '../spec_helper'

# User viewing a particular station
# And clicking on the delete button
# Is redirected to the view all page
# And does not contain deleted station

RSpec.describe "user can delete a station" do
  it "takes you to view all page and entry is deleted" do
    City.create(name: "Vancover")
    city = City.find(1)
    city.stations.create(name: "MLK", dock_count: 35, installation_date: "9/12/2010")
    city.stations.create(name: "Malcolm X", dock_count: 35, installation_date: "9/12/2011")

    visit("/stations/1")

    click_on "Delete"
    expect(current_path).to eq("/stations/view_all")
    expect(page).to_not have_content("MLK")
    save_and_open_page
  end
end
