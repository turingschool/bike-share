require_relative '../spec_helper'

RSpec.describe "When a user visits '/weather_conditions'" do

  it "they see a list of conditions" do

    WeatherCondition.create(max_temperature_f: 99.0, min_temperature_f: -121.9, mean_temperature_f: 55.0, mean_humidity: 62.5, mean_visibility_miles: 0.2, mean_wind_speed_mph: 20.0, precipitation_inches: 1.2, date: Date.parse('29/10/1986'))

    visit '/weather_conditions'

    within("h2.title") do
      expect(page).to have_content("Weather")
    end

    within("li>a") do
      expect(page).to have_content("#{(Date.parse('29/10/1986'))}")
    
    end
  end
end
