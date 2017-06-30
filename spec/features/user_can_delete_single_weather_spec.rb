require_relative '../spec_helper'

RSpec.describe "When a user needs to delete a weather entry" do
  it 'they can destroy a weather entry, with a delete button' do

    weather = WeatherCondition.create(max_temperature_f: 99.0, min_temperature_f: -121.9,
    mean_temperature_f: 55.0, mean_humidity: 62.5, mean_visibility_miles: 0.2, mean_wind_speed_mph: 20.0,
    precipitation_inches: 1.2, date: Date.parse('29/10/1986'))

    visit "/weather_conditions/#{weather.id}"

    click_on "Delete"

    expect(current_path).to eq('/weather_conditions')
    expect(page).to_not have_content(weather.date)
  end
end
