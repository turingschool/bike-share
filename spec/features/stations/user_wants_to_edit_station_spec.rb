require './spec/spec_helper'

RSpec.describe "user visits stations index" do

  it "goes to edit page" do
    Loader.new('./spec/fixtures/station_fixtures_small.csv').load_stations

    visit('/stations/1/edit')

    expect(page).to have_field("station[name]", :with => "San Jose Diridon Caltrain Station")
    expect(page).to have_field("station[dock_count]", :with => 27)
    expect(page).to have_field("city", :with => "San Jose")
    expect(page).to have_field("station[install_date]", :with => "Aug 6 2013")
  end

  it "edits a station" do
    Loader.new('./spec/fixtures/station_fixtures_small.csv').load_stations

    visit('/stations/1/edit')
    fill_in "station[name]", with: 'Fluppydo'

    click_button "Submit"
    expect(page).to have_field("station[name]", :with => "Fluppydo")
  end

  it "edits with no name" do
    Loader.new('./spec/fixtures/station_fixtures_small.csv').load_stations

    visit('/stations/1/edit')
    fill_in "station[name]", with: ''

    click_button "Submit"

    expect(page).to have_field("station[name]", :with => "can't be blank")
  end

  it "edits with docks" do
    Loader.new('./spec/fixtures/station_fixtures_small.csv').load_stations

    visit('/stations/1/edit')
    fill_in "station[dock_count]", with: ''

    click_button "Submit"

    expect(page).to have_field("station[dock_count]", :with => "can't be blank")
  end

  it "edits with 0 docks" do
    Loader.new('./spec/fixtures/station_fixtures_small.csv').load_stations

    visit('/stations/1/edit')
    fill_in "station[dock_count]", with: 0

    click_button "Submit"

    expect(page).to have_field("station[dock_count]", :with => "must be greater than 0")
  end

  it "edits docks with non-int" do
    Loader.new('./spec/fixtures/station_fixtures_small.csv').load_stations

    visit('/stations/1/edit')
    fill_in "station[dock_count]", with: 'googlybloo'

    click_button "Submit"

    expect(page).to have_field("station[dock_count]", :with => "is not a number")
  end

  it "edits with no city" do
    Loader.new('./spec/fixtures/station_fixtures_small.csv').load_stations

    visit('/stations/1/edit')
    fill_in "city", with: ''

    click_button "Submit"

    expect(page).to have_field("city", :with => "can't be blank")
  end

  it "edits with no date" do
    Loader.new('./spec/fixtures/station_fixtures_small.csv').load_stations

    visit('/stations/1/edit')
    fill_in "station[install_date]", with: ''

    click_button "Submit"

    expect(page).to have_field("station[install_date]", :with => "can't be blank")
  end

  it "edits with invalid date" do
    Loader.new('./spec/fixtures/station_fixtures_small.csv').load_stations

    visit('/stations/1/edit')
    fill_in "station[install_date]", with: ''

    click_button "Submit"

    expect(page).to have_field("station[install_date]", :with => "can't be blank")
  end

end