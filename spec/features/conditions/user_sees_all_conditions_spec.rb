require './spec/spec_helper'

RSpec.describe "user visits conditions index" do

  it 'sees header and empty page with no database' do
    visit('/conditions')
    expect(page).to have_content("Conditions")

  end

  it 'sees all conditions with database' do
    Loader.new('./spec/fixtures/station_fixtures.csv').load_stations
    Loader.new('./spec/fixtures/weather_fixture.csv').load_conditions
    visit('/conditions')

    expect(page).to have_content("Date: 2013-08-29 00:00:00 UTC")
    expect(page).to have_content("Zip Code: 94107")
    expect(page).to have_content("Max Temperature: 74")
    expect(page).to have_content("Mean Temperature: 68")
    expect(page).to have_content("Min Temperature: 61")
    expect(page).to have_content("Mean Humidity: 75 %")
    expect(page).to have_content("Mean Visibility (in Miles): 10")
    expect(page).to have_content("Mean Wind Speed (mph): 11")
    expect(page).to have_content("Precipitation (inches): 0.0")
    expect(page).to have_content("Edit Weather Conditions")

    expect(page).to have_content("Date: 2013-08-30 00:00:00 UTC")
    expect(page).to have_content("Zip Code: 94107")
    expect(page).to have_content("Max Temperature: 78")
    expect(page).to have_content("Mean Temperature: 69")
    expect(page).to have_content("Min Temperature: 60")
    expect(page).to have_content("Mean Humidity: 70 %")
    expect(page).to have_content("Mean Visibility (in Miles): 10")
    expect(page).to have_content("Mean Wind Speed (mph): 13")
    expect(page).to have_content("Precipitation (inches): 0.0")
  end

end
