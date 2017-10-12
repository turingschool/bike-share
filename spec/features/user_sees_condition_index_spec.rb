require 'spec_helper'

describe "Feature" do
  describe "when a user visits '/conditions'" do
    it "they see conditions" do
      visit "/conditions"

      within("#body-content") do
        expect(page).to have_content("Weather Conditions")
      end
    end
  end

  describe "when a user clicks on edit" do
    it "they will see the edit page" do
      Condition.create!(
        date: Date.new(2013,8,28),
        max_temperature_f: 70,
        min_temperature_f: 40,
        mean_temperature_f: 60,
        mean_humidity: 30,
        mean_visibility_miles: 10,
        mean_wind_speed_mph: 4 ,
        precipitation_inches: 1,
        zip_code: 95234)
      visit "/conditions"
      click_on "Edit"

      expect(page).to have_content("Edit Weather Conditions Report")
    end
  end

  describe "when a user clicks on create a new condition" do
    it "they will see the new condition page" do
      Condition.create!(
        date: Date.new(2013,8,28),
        max_temperature_f: 70,
        min_temperature_f: 40,
        mean_temperature_f: 60,
        mean_humidity: 30,
        mean_visibility_miles: 10,
        mean_wind_speed_mph: 4 ,
        precipitation_inches: 1,
        zip_code: 95234)

      visit "/conditions"
      click_on "Add Weather Conditions"

      expect(page).to have_content("New Weather Conditions Report")
    end
  end

  describe "when a user clicks on create a show" do
    it "they will see the show page" do
      Condition.create!(
      date: Date.new(2013,8,28),
      max_temperature_f: 70,
      min_temperature_f: 40,
      mean_temperature_f: 60,
      mean_humidity: 30,
      mean_visibility_miles: 10,
      mean_wind_speed_mph: 4 ,
      precipitation_inches: 1,
      zip_code: 95234)
      visit "/conditions"
      click_on "Show"

      expect(page).to have_content("Whats yo Condition!")
    end
  end
end
