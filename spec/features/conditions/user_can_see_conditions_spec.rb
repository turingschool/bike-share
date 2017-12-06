require 'spec_helper'

describe "as a user" do
  describe "when I visit '/conditions' it displays weather conditions" do
    before :each do
      @condition = Condition.create(date: "2014-08-20", max_temperature_f: 70,
      mean_temperature_f: 60, min_temperature_f: 50, mean_humidity: 20,
      mean_visibility_miles: 50, mean_wind_speed_mph: 12, precipitation_inches: 4,
      zip_code: 94127)

      visit '/conditions'
    end

    it "I expect to see condition date" do
      expect(page.status_code).to eq(200)

      expect(page).to have_content("2014-08-20")
    end

    it "I expect to see condition max temp" do
      expect(page).to have_content(70)
    end

    it "I expect to see condition mean temp" do
      expect(page).to have_content(60)
    end

    it "I expect to see condition min temp" do
      expect(page).to have_content(50)
    end

    it "I expect to see condition mean humidity" do
      expect(page).to have_content(20)
    end

    it "I expect to see condition mean visibility in miles" do
      expect(page).to have_content(50)
    end

    it "I expect to see condition wind speed mean in mph" do
      expect(page).to have_content(12)
    end

    it "I expect to see condition precipitation in inches" do
      expect(page).to have_content(4)
    end

    it "I expect to be able to edit a condition" do
      click_link("Edit")

      expect(current_path).to eq('/conditions/2014-08-20/edit')
    end

    it "I expect to ba able to delete a condition" do
      click_button("Delete")

      expect(current_path).to eq('/conditions')
    end
  end
end
