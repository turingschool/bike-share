require_relative '../spec_helper'

RSpec.describe "When a user visits '/show'" do

  before do
    weather = WeatherCondition.create(max_temperature_f: 99.0, min_temperature_f: -121.9,
    mean_temperature_f: 55.0, mean_humidity: 62.5, mean_visibility_miles: 0.2, mean_wind_speed_mph: 20.0,
    precipitation_inches: 1.2, date: Date.parse('29/10/1986'))

    visit "/weather_condition/#{weather.id}"
  end

  it 'they see a single weather condition' do

    within('h2.date') do
      expect(page).to have_content(Date.parse('29/10/1986'))
    end

    within('p.max_temperature_f') do
      expect(page).to have_content(99.0)
    end

    within('p.min_temperature_f') do
      expect(page).to have_content(-121.9)
    end

    within('p.mean_temperature_f') do
      expect(page).to have_content(55.0)
    end

    within('p.mean_humidity') do
      expect(page).to have_content(62.5)
    end

    within('p.mean_visibility_miles') do
      expect(page).to have_content(0.2)
    end

    within('p.mean_wind_speed_mph') do
      expect(page).to have_content(20.0)
    end

    within('p.precipitation_inches') do
      expect(page).to have_content(1.2)
    end
  end
end
