require_relative '../spec_helper'

RSpec.describe "When a user needs to edit/update a weather_condition" do
attr_reader :weather

    before do
      @weather = WeatherCondition.create(max_temperature_f: 99.0, min_temperature_f: -121.9,
      mean_temperature_f: 55.0, mean_humidity: 62.5, mean_visibility_miles: 0.2, mean_wind_speed_mph: 20.0,
      precipitation_inches: 1.2, date: Date.parse('29/10/1986'))

      visit "/weather_conditions/#{weather.id}"
    end

      it "it populates the fields from our weather/edit" do
    click_on 'Edit'
    expect(current_path).to eq("/weather_conditions/#{weather.id}/edit")

    expect(page).to have_selector("input[value= '99.0']")
    expect(page).to have_selector("input[value= '-121.9']")
    expect(page).to have_selector("input[value= '55.0']")
    expect(page).to have_selector("input[value= '0.2']")

    fill_in "weather_condition[date]", with: Date.parse('8/6/2013')
    fill_in "weather_condition[max_temperature_f]", with: 3.14
    fill_in "weather_condition[min_temperature_f]", with: 3.14
    fill_in "weather_condition[mean_temperature_f]", with: 3.14
    fill_in "weather_condition[mean_humidity]", with: 3.14
    fill_in "weather_condition[mean_visibility_miles]", with: 3.14
    fill_in "weather_condition[mean_wind_speed_mph]", with: 3.14
    fill_in "weather_condition[precipitation_inches]", with: 3.14

    click_on "Submit"

    expect(current_path).to eq("/weather_conditions/#{weather.id}")

    expect(page).to have_content(3.14)
    expect(page).to have_content("#{(Date.parse('8/6/2013'))}")
  end
end
