require_relative '../spec_helper'

# User can edit a particular station
# And clicks submit
# And expects to view updated

RSpec.describe "user can fill in form" do
  it "it updates page with correct information" do
      city = City.create(name: "Washington DC")
      City.create(name: "Frankfurt")
      City.create(name: "Tokyo")
      station = city.stations.create!(name: "MLK", dock_count: 32, installation_date: "1984-05-24")

      visit('/stations/1/edit')
      fill_in "station[name]", with: "Malcolm X"
      select("Tokyo", :from => "city[name]")

      click_button "Submit changes"
      save_and_open_page
      expect(current_path).to eq('/stations/1')
      expect(page).to have_content("Malcolm X")
      expect(page).to have_content("Tokyo")
  end
end
