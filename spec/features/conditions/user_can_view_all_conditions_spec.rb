require './spec/spec_helper'

RSpec.describe "When a user views conditions index" do
  it "they see the page header" do
    visit('/conditions')
    expect(page).to have_content("All Weather Conditions")
  end

  it "they can add new conditions" do
    visit('/conditions')
    expect(page).to have_content("Add New Weather Condition")
    expect(page).to have_selector('a.btn-new')
  end

  context "when no conditions have been added" do
    it "the users sees a no conditions message" do
      visit('/conditions')
      expect(page).to have_content("No conditions available.")
    end
  end

  context "when conditions exist" do
    before {
      zip = Zipcode.create(zipcode: "09000")
      zip_2 = Zipcode.create(zipcode: "90000")
      Condition.create(
                        date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                        max_temp: 87.0,
                        mean_temp: 76.0,
                        min_temp: 54.0,
                        mean_humidity: 90.0,
                        mean_visibility: 10.0,
                        mean_wind_speed: 11.0,
                        precipitation: 0,
                        zipcode_id: zip.id
                      )
      Condition.create(
                        date: Date.strptime("08/30/2014",'%m/%d/%Y'),
                        max_temp: 77.0,
                        mean_temp: 66.0,
                        min_temp: 44.0,
                        mean_humidity: 80.0,
                        mean_visibility: 20.0,
                        mean_wind_speed: 21.0,
                        precipitation: 10.0,
                        zipcode_id: zip_2.id
                      )
      visit('/conditions')
    }
    it "the user sees information about entered weather conditions" do
      expect(page).to have_content("Date")
      expect(page).to have_content("08/30/2013")
      expect(page).to have_content("08/30/2014")
      expect(page).to have_content("Max Temperature")
      expect(page).to have_content("87.0")
      expect(page).to have_content("77.0")
      expect(page).to have_content("Mean Temperature")
      expect(page).to have_content("76.0")
      expect(page).to have_content("66.0")
      expect(page).to have_content("Min Temperature")
      expect(page).to have_content("54.0")
      expect(page).to have_content("44.0")
      expect(page).to have_content("Mean Humidity")
      expect(page).to have_content("90.0")
      expect(page).to have_content("80.0")
      expect(page).to have_content("Mean Visibility (in Miles)")
      expect(page).to have_content("10.0")
      expect(page).to have_content("20.0")
      expect(page).to have_content("Mean Wind Speed (mph)")
      expect(page).to have_content("11.0")
      expect(page).to have_content("21.0")
      expect(page).to have_content("Precipitation (inches)")
      expect(page).to have_content("0")
      expect(page).to have_content("10.0")
      expect(page).to have_content('Zipcode')
      expect(page).to have_content('09000')
      expect(page).to have_content('90000')
    end
  end
end
