require_relative '../spec_helper'

RSpec.describe "When a user visits 'new'" do

    # before do
    #   weather = WeatherCondition.create(max_temperature_f: 99.0, min_temperature_f: -121.9,
    #   mean_temperature_f: 55.0, mean_humidity: 62.5, mean_visibility_miles: 0.2, mean_wind_speed_mph: 20.0,
    #   precipitation_inches: 1.2, date: Date.parse('29/10/1986'))
    # end

    it 'they can create a new weather_condition' do

    visit '/weather_conditions/new'

    fill_in "weather_condition[date]", with: Date.parse('8/6/2013')
    fill_in "weather_condition[max_temperature_f]", with: 3.14
    fill_in "weather_condition[min_temperature_f]", with: 3.14
    fill_in "weather_condition[mean_temperature_f]", with: 3.14
    fill_in "weather_condition[mean_humidity]", with: 3.14
    fill_in "weather_condition[mean_visibility_miles]", with: 3.14
    fill_in "weather_condition[mean_wind_speed_mph]", with: 3.14
    fill_in "weather_condition[precipitation_inches]", with: 3.14

    click_on "Submit"

    expect( current_path ).to eq('/weather_conditions')
    # expect(page).to have_content("Date: ")
    # expect(page).to have_content("Date")
    expect(page).to have_content("Max Temp: 3.14")
    # expect(page).to have_content("Min Temp: 3.14")
    # expect(page).to have_content("Mean Temp: 3.14")
    # expect(page).to have_content("Mean Humidity: 3.14")
    # expect(page).to have_content("Mean Visibility Miles: 3.14")
    # expect(page).to have_content("Mean Wind Speed MPH: 3.14")
    # expect(page).to have_content("Precipiation Inches: 3.14")

  end
end
