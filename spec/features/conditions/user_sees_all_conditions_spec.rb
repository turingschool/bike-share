require './spec/spec_helper'

RSpec.describe "user visits conditions index" do

  it 'sees header and empty page with no database' do
    visit('/conditions')

    expect(page).to have_content("Conditions")

    expect(page).not_to have_content("Name:")
    expect(page).not_to have_content("Number of Docks")
    expect(page).not_to have_content("City")
    expect(page).not_to have_content("Install Date")
  end

  it 'sees all stations with database' do
    # Loader.new('./spec/fixtures/station_fixtures_small.csv').load_stations
    Loader.new('./spec/fixtures/weather_fixture.csv').load_conditions
    visit('/conditions')

    # save_and_open_page
  end

end
