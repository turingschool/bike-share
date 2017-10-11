require 'spec_helper'

describe "Feature" do
  describe "when a user visits '/trips'" do
    it "they see trips" do
      visit "/trips"

      within("#body-content") do
        expect(page).to have_content("Trips Taken")
      end
    end
  end

  describe "when a user clicks on edit" do
    it "they will see the edit page" do
      Trip.create!(
        duration: 63,
        start_date: DateTime.new(2014,8,29,14,13),
        start_station_name: "South Van Ness at Market",
        start_station_id: 66,
        end_date: DateTime.new(2014,8,29,14,14),
        end_station_name: "South Van Ness at Market",
        end_station_id: 66,
        bike_id: 400,
        zip_code: 94127,
        subscription_type: "Subscriber")
      visit "/trips"
      click_on "Edit"

      expect(page).to have_content("Edit Trip")
    end
  end

  describe "when a user clicks on create a new trip" do
    it "they will see the new trip page" do
      Trip.create!(
        duration: 63,
        start_date: DateTime.new(2014,8,29,14,13),
        start_station_name: "South Van Ness at Market",
        start_station_id: 66,
        end_date: DateTime.new(2014,8,29,14,14),
        end_station_name: "South Van Ness at Market",
        end_station_id: 66,
        bike_id: 400,
        zip_code: 94127,
        subscription_type: "Subscriber")
      visit "/trips"
      click_on "Create a new trip"

      expect(page).to have_content("New Trip")
    end
  end

  describe "when a user clicks on create a show" do
    it "they will see the show page" do
      Trip.create!(
        duration: 63,
        start_date: DateTime.new(2014,8,29,14,13),
        start_station_name: "South Van Ness at Market",
        start_station_id: 66,
        end_date: DateTime.new(2014,8,29,14,14),
        end_station_name: "South Van Ness at Market",
        end_station_id: 66,
        bike_id: 400,
        zip_code: 94127,
        subscription_type: "Subscriber")
      visit "/trips"
      click_on "Show"

      expect(page).to have_content("Trip")
    end
  end
end
