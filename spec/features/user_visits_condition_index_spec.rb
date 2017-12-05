require 'spec_helper'

describe "when a visitor visits the conditions index" do
  it "sees a list of all the conditions" do
    visit '/conditions'

    expect(page).to have_content("Weather conditions")
  end
  #
  it "can click the link to create a new condition" do
    visit '/conditions'
    click_link('Create a new condition')

    expect(page).to have_current_path("/conditions/new")
    expect(page).to have_content("Make new condition")
  end

  it "clicks the name of the condition to display its information" do
       Condition.create!(
          date: '2013-08-31',
          max_temperature_f: 2,
          mean_temperature_f: 2,
          min_temperature_f: 3,
          mean_humidity: 3,
          mean_visibility_miles: 4,
          precipitation_inches: 2,
          mean_wind_speed_mph:2
        )
    visit '/conditions'

    click_link('2013-08-31')

    expect(page).to have_content("Min Temp")
  end

  it "clicks edit condition of the condition to display the edit condition page" do
       Condition.create!(
          date: '2013-08-31',
          max_temperature_f: 2,
          mean_temperature_f: 2,
          min_temperature_f: 3,
          mean_humidity: 3,
          mean_visibility_miles: 4,
          precipitation_inches: 2,
          mean_wind_speed_mph:2
        )
    visit '/conditions'

    click_on('Edit')

    expect(page).to have_content("Min Temp")
  end

  it "clicks delete condition of the condition to display the delete  condition index page" do
       Condition.create!(
          date: '2013-08-31',
          max_temperature_f: 2,
          mean_temperature_f: 2,
          min_temperature_f: 3,
          mean_humidity: 3,
          mean_visibility_miles: 4,
          precipitation_inches: 2,
          mean_wind_speed_mph:2
        )
    visit '/conditions'

    click_on('Delete')

    expect(page).to have_content("Weather conditions")
  end

  #
  # it "clicks the edit link and is presented an edit form" do
  #   Station.create(name: "The station", dock_count: 33, city: "San Francisco", installation_date: "04-03-1204")
  #   visit '/conditions'
  #   click_link('Edit')
  #
  #   expect(page).to have_content("Edit your station")
  # end
  #
  # it "clicks the delete button which deletes station and redirects to index" do
  #   Station.create(name: "The station", dock_count: 33, city: "San Francisco", installation_date: "04-03-1204")
  #   visit '/conditions'
  #   click_on('delete')
  #
  #   expect(page).to have_content("Bike Station Details")
  #   expect(Station.count).to eq(0)
  # end

end