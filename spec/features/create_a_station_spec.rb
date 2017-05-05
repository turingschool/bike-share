require_relative '../spec_helper'

RSpec.describe "Station CRUD" do
  describe "creating a station" do
    it "allows the user to fill out a form to create a station" do
      visit("/stations/new")
      fill_in "name", with: "stationicus"
      fill_in "dock_count", with: "42"
      fill_in "city", with: "Denver"
      fill_in "installation_date", with: "8/6/2013"
      click_on "Submit"

      expect(page).to have_content("stationicus")
      # need to find out if params is available in this context
      # expect(page).to have_current_path("stations/#{params[:id]}")
    end

  end
end
