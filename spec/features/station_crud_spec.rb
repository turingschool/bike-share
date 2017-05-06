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

  describe "reading stations" do
    it "allows the user to see an index of stations, and a single station" do
      visit("/stations/new")
      fill_in "station[name]", with: "station 1"
      fill_in "station[dock_count]", with: "42"
      fill_in "station[city]", with: "Denver"
      fill_in "station[date]", with: "8/6/2013"
      click_on "Submit"

      visit("/stations/new")
      fill_in "station[name]", with: "station 2"
      fill_in "station[dock_count]", with: "42"
      fill_in "station[city]", with: "Denver"
      fill_in "station[date]", with: "8/6/2013"
      click_on "Submit"

      visit("/stations")
      expect(page).to have_content("station 1")
      expect(page).to have_content("station 2")

      click_on "Details"
      expect(page).to have_content("station 1")
    end
  end
end
