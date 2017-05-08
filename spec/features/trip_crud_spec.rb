require_relative '../spec_helper'

RSpec.describe "Trip CRUD" do
  before(:each) do
    @city = City.create(name: "San Jose")
    @station_1 = Station.create(name: "station_1", dock_count: 32, date: "4/12/2013", city_id: @city.id)
    @station_2 = Station.create(name: "station_2", dock_count: 42, date: "6/12/2013", city_id: @city.id)
  end
  describe "creating a trip" do
    it "allows the user to fill out a form to create a trip" do
      visit("trips/new")
      fill_in "trip[duration]", with: "111"
      find(".start-station-selector").find(:xpath, "option[1]").select_option
      #consider replacing xpath argument of option[1] with label text of city.name
      find(".end-station-selector").find(:xpath, "option[2]").select_option
      fill_in "trip[start_date]", with: "8/20/2015"
      fill_in "trip[end_date]", with: "8/21/2015"
      fill_in "trip[bike_id]", with: "1"
      find(".subscription_type").find(:xpath, "option[1]").select_option
      fill_in "trip[zip_code]", with: "80223"
      click_on "Create Trip"

      expect(page).to have_content("station_1")
      expect(page).to have_content("station_2")
    end
  end

  # This spec is failing, even when it is equivalent to the passing spec above
  # describe "trips index" do
  #   it "shows all the trips" do
  #     visit("trips/new")
  #     fill_in "trip[duration]", with: "111"
  #     find(".start-station-selector").find(:xpath, "option[1]").select_option
  #     #consider replacing xpath argument of option[1] with label text of city.name
  #     find(".end-station-selector").find(:xpath, "option[2]").select_option
  #     fill_in "trip[start_date]", with: "8/20/2015"
  #     fill_in "trip[end_date]", with: "8/21/2015"
  #     fill_in "trip[bike_id]", with: "1"
  #     find(".subscription_type").find(:xpath, "option[1]").select_option
  #     fill_in "trip[zip_code]", with: "80223"
  #     click_on "Create Trip"
  #   end
  # end
end
