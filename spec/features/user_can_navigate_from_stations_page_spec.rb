require_relative '../spec_helper'

RSpec.describe "When a user visits '/stations'" do
  it "they see a welcome message and click a station" do
    date = DateRef.create!(date: "2010-01-01")
    city = City.create!(name: "Denver")
    Station.create!(name: "Broadway", dock_count: 10, city_id: city.id, date_ref_id: date.id)

      # As a user
      # When I visit /stations
      visit('/stations')
      # Then I see a station
      expect(page).to have_content("Denver")
      expect(page).to have_content("Broadway")
      expect(page).to have_content("10")
      expect(page).to have_content("2010-01-01")

      #Then I click station
      click_link("Broadway")
      #And it takes me to the station page
      expect(current_path).to eq("/stations/1")
  end

  # it "they can edit a station from '/stations'"
  #
  # end
end
