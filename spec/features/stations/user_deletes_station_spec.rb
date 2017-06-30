require './spec/spec_helper'

RSpec.describe "user clicks delete" do

  it 'does not see station' do
    Loader.new('./spec/fixtures/station_fixtures_small.csv').load_stations
    visit('/stations')

    expect(Station.count).to eq(2)

    first(:button, "Delete").click
    expect(Station.count).to eq(1)

    first(:button, "Delete").click
    expect(Station.count).to eq(0)

    expect(page).not_to have_content("Name: San Jose Diridon Caltrain Station")
    expect(page).not_to have_content("Number of Docks: 27")
    expect(page).not_to have_content("City: San Jose")
    expect(page).not_to have_content("Install Date: 2013-06-08 00:00:00 UTC")
  end

end