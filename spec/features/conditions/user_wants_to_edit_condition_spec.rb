require './spec/spec_helper'

RSpec.describe "user visits conditions index" do

  it "goes to edit page" do
    Loader.new('./spec/fixtures/station_fixtures.csv').load_stations
    Loader.new('./spec/fixtures/weather_fixture.csv').load_conditions

    visit('/conditions/1/edit')
    
    expect(page).to have_field("condition[date]", :with => "2013-08-29 00:00:00 UTC")
    expect(page).to have_field("condition[zip_code]", :with => "94107")
    expect(page).to have_field("condition[maximum_temperature]", :with => "74")
    expect(page).to have_field("condition[mean_temperature]", :with => "68")
    expect(page).to have_field("condition[minimum_temperature]", :with => "61")
    expect(page).to have_field("condition[mean_humidity]", :with => "75")
    expect(page).to have_field("condition[mean_visibility]", :with => "10")
    expect(page).to have_field("condition[mean_wind_speed]", :with => "11")
    expect(page).to have_field("condition[precipitation]", :with => "0.0")
    expect(page).to have_field("city", :with => "San Francisco")
  end

  it "edits mean wind speed of condition" do
    Loader.new('./spec/fixtures/station_fixtures.csv').load_stations
    Loader.new('./spec/fixtures/weather_fixture.csv').load_conditions

    visit('/conditions/1/edit')
    fill_in "condition[mean_wind_speed]", with: "69"
    click_button "Submit"

    expect(page).to have_content("2013-08-29 00:00:00 UTC")
    expect(page).to have_content("94107")
    expect(page).to have_content("74")
    expect(page).to have_content("68")
    expect(page).to have_content("61")
    expect(page).to have_content("75")
    expect(page).to have_content("10")
    expect(page).to have_content("69")
    expect(page).to have_content("0.0")
    expect(page).to have_content("San Francisco")
  end

  it "edits zip code of condition" do
    Loader.new('./spec/fixtures/station_fixtures.csv').load_stations
    Loader.new('./spec/fixtures/weather_fixture.csv').load_conditions

    visit('/conditions/1/edit')
    fill_in "condition[zip_code]", with: "80206"
    click_button "Submit"

    expect(page).to have_content("2013-08-29 00:00:00 UTC")
    expect(page).to have_content("80206")
    expect(page).to have_content("74")
    expect(page).to have_content("68")
    expect(page).to have_content("61")
    expect(page).to have_content("75")
    expect(page).to have_content("10")
    expect(page).to have_content("11")
    expect(page).to have_content("0.0")
    expect(page).to have_content("San Francisco")
  end

  it "edits city of condition" do
    Loader.new('./spec/fixtures/station_fixtures.csv').load_stations
    Loader.new('./spec/fixtures/weather_fixture.csv').load_conditions

    visit('/conditions/1/edit')
    fill_in "city", with: "Denver"
    click_button "Submit"

    expect(page).to have_content("2013-08-29 00:00:00 UTC")
    expect(page).to have_content("94107")
    expect(page).to have_content("74")
    expect(page).to have_content("68")
    expect(page).to have_content("61")
    expect(page).to have_content("75")
    expect(page).to have_content("10")
    expect(page).to have_content("11")
    expect(page).to have_content("0.0")
    expect(page).to have_content("Denver")
  end

  it "edits date of condition" do
    Loader.new('./spec/fixtures/station_fixtures.csv').load_stations
    Loader.new('./spec/fixtures/weather_fixture.csv').load_conditions

    visit('/conditions/1/edit')
    fill_in "condition[date]", with: "2017-03-13"
    click_button "Submit"

    expect(page).to have_content("2017-03-13 00:00:00 UTC")
    expect(page).to have_content("94107")
    expect(page).to have_content("74")
    expect(page).to have_content("68")
    expect(page).to have_content("61")
    expect(page).to have_content("75")
    expect(page).to have_content("10")
    expect(page).to have_content("11")
    expect(page).to have_content("0.0")
    expect(page).to have_content("San Francisco")
  end

  it "edits maximum temperature" do
    Loader.new('./spec/fixtures/station_fixtures.csv').load_stations
    Loader.new('./spec/fixtures/weather_fixture.csv').load_conditions

    visit('/conditions/1/edit')
    fill_in "condition[maximum_temperature]", with: "150"
    click_button "Submit"

    expect(page).to have_content("2013-08-29 00:00:00 UTC")
    expect(page).to have_content("94107")
    expect(page).to have_content("150")
    expect(page).to have_content("68")
    expect(page).to have_content("61")
    expect(page).to have_content("75")
    expect(page).to have_content("10")
    expect(page).to have_content("11")
    expect(page).to have_content("0.0")
    expect(page).to have_content("San Francisco")
  end

  it "edits mean temperature" do
    Loader.new('./spec/fixtures/station_fixtures.csv').load_stations
    Loader.new('./spec/fixtures/weather_fixture.csv').load_conditions

    visit('/conditions/1/edit')
    fill_in "condition[mean_temperature]", with: "275"
    click_button "Submit"

    expect(page).to have_content("2013-08-29 00:00:00 UTC")
    expect(page).to have_content("94107")
    expect(page).to have_content("74")
    expect(page).to have_content("275")
    expect(page).to have_content("61")
    expect(page).to have_content("75")
    expect(page).to have_content("10")
    expect(page).to have_content("11")
    expect(page).to have_content("0.0")
    expect(page).to have_content("San Francisco")
  end

  it "edits minimum temperature" do
    Loader.new('./spec/fixtures/station_fixtures.csv').load_stations
    Loader.new('./spec/fixtures/weather_fixture.csv').load_conditions

    visit('/conditions/1/edit')
    fill_in "condition[minimum_temperature]", with: "1"
    click_button "Submit"

    expect(page).to have_content("2013-08-29 00:00:00 UTC")
    expect(page).to have_content("94107")
    expect(page).to have_content("74")
    expect(page).to have_content("68")
    expect(page).to have_content("1")
    expect(page).to have_content("75")
    expect(page).to have_content("10")
    expect(page).to have_content("11")
    expect(page).to have_content("0.0")
    expect(page).to have_content("San Francisco")
  end

  it "edits mean humidity" do
    Loader.new('./spec/fixtures/station_fixtures.csv').load_stations
    Loader.new('./spec/fixtures/weather_fixture.csv').load_conditions

    visit('/conditions/1/edit')
    fill_in "condition[mean_humidity]", with: "500"
    click_button "Submit"

    expect(page).to have_content("2013-08-29 00:00:00 UTC")
    expect(page).to have_content("94107")
    expect(page).to have_content("74")
    expect(page).to have_content("68")
    expect(page).to have_content("61")
    expect(page).to have_content("500")
    expect(page).to have_content("10")
    expect(page).to have_content("11")
    expect(page).to have_content("0.0")
    expect(page).to have_content("San Francisco")
  end

  it "edits mean visibility" do
    Loader.new('./spec/fixtures/station_fixtures.csv').load_stations
    Loader.new('./spec/fixtures/weather_fixture.csv').load_conditions

    visit('/conditions/1/edit')
    fill_in "condition[mean_visibility]", with: "800"
    click_button "Submit"

    expect(page).to have_content("2013-08-29 00:00:00 UTC")
    expect(page).to have_content("94107")
    expect(page).to have_content("74")
    expect(page).to have_content("68")
    expect(page).to have_content("61")
    expect(page).to have_content("75")
    expect(page).to have_content("800")
    expect(page).to have_content("11")
    expect(page).to have_content("0.0")
    expect(page).to have_content("San Francisco")
  end

  it "edits precipitation" do
    Loader.new('./spec/fixtures/station_fixtures.csv').load_stations
    Loader.new('./spec/fixtures/weather_fixture.csv').load_conditions

    visit('/conditions/1/edit')
    fill_in "condition[precipitation]", with: "6.9"
    click_button "Submit"

    expect(page).to have_content("2013-08-29 00:00:00 UTC")
    expect(page).to have_content("94107")
    expect(page).to have_content("74")
    expect(page).to have_content("68")
    expect(page).to have_content("61")
    expect(page).to have_content("75")
    expect(page).to have_content("10")
    expect(page).to have_content("11")
    expect(page).to have_content("6.9")
    expect(page).to have_content("San Francisco")
  end

  it "edits with invalid date" do
    Loader.new('./spec/fixtures/station_fixtures.csv').load_stations
    Loader.new('./spec/fixtures/weather_fixture.csv').load_conditions

    visit('/conditions/1/edit')
    fill_in "condition[date]", with: ''

    click_button "Submit"

    expect(page).to have_field("condition[date]", :with => "can't be blank")
  end
end
