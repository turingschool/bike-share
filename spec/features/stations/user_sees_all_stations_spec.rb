require './spec/spec_helper'

RSpec.describe "user visits stations index" do

  it 'sees header and empty page with no database' do
    visit('/stations')

    expect(page).to have_content("Stations")

    expect(page).not_to have_content("Name:")
    expect(page).not_to have_content("Number of Docks")
    expect(page).not_to have_content("City")
    expect(page).not_to have_content("Istall Date")
  end

  it 'sees all stations with database' do
    Loader.new('./spec/fixtures/station_fixtures_small.csv').load_stations
    visit('/stations')

    save_and_open_page
    expect(page).to have_content("Name: San Jose Diridon Caltrain Station")
    expect(page).to have_content("Number of Docks: 27")
    expect(page).to have_content("City: San Jose")
    expect(page).to have_content("Install Date: Aug 6 2013")

    expect(page).to have_content("Name: San Jose Civic Center")
    expect(page).to have_content("Number of Docks: 15")
    expect(page).to have_content("City: San Jose")
    expect(page).to have_content("Install Date: Aug 5 2013")
  end

end