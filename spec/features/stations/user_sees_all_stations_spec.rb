require './spec/spec_helper'

RSpec.describe "user visits stations index" do

  it 'sees header and empty page with no database' do
    visit('/stations')

    expect(page).to have_content("Stations")

    expect(page).not_to have_content("Name:")
    expect(page).not_to have_content("Number of Docks")
    expect(page).not_to have_content("City")
    expect(page).not_to have_content("Install Date")
  end

  it 'sees all stations with database' do
    Loader.new('./spec/fixtures/station_fixtures_small.csv').load_stations
    visit('/stations')

    expect(page).to have_content("Name: San Jose Diridon Caltrain Station")
    expect(page).to have_content("Number of Docks: 27")
    expect(page).to have_content("City: San Jose")
    expect(page).to have_content("Install Date: 2013-06-08 00:00:00 UTC")

    expect(page).to have_content("Name: San Jose Civic Center")
    expect(page).to have_content("Number of Docks: 15")
    expect(page).to have_content("City: San Jose")
    expect(page).to have_content("Install Date: 2013-05-08 00:00:00 UTC")
  end

end