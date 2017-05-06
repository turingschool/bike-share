require_relative '../spec_helper'

# User can edit a particular station
# And clicks submit
# And expects to view updated

RSpec.describe "user can fill in form" do
  it "it updates page with correct information" do

      City.create(name: "Washington DC")
      city = City.find(1)
      station = city.stations.create(name: "MLK", dock_count: 32, installation_date: "5/24/1984")

      visit('/stations/1/edit')
      fill_in "Name", with: "Malcolm X"

      click_on "Submit"
      expect(current_path).to eq('/stations/1')
      expect(page).to have_content("Malcolm X")
      save_and_open_page
  end
end
