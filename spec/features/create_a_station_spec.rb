require_relative '../spec_helper'

RSpec.describe "Station CRUD" do
  describe "creating a station" do
    it "allows the user to fill out a form to create a station" do
      visit("/stations/new")
      fill_in "station[name]", with: "stationicus"
      fill_in "station[dock_count]", with: "42"
      fill_in "station[city]", with: "Denver"
      fill_in "station[date]", with: "8/6/2013"
      click_on "Submit"

      expect(page).to have_content("stationicus")
    end
  end
end
