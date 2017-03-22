require_relative '../spec_helper'

RSpec.describe "Clicking Delete removes station from list" do
  it "Can delete stations from list" do
    Condition.create(date: format_date("8/29/2013"),
                     max_temperature_f: 4,
                     mean_temperature_f: 6,
                     min_temperature_f: 32,
                     mean_humidity: 12,
                     mean_visibility_miles: 1,
                     mean_wind_speed_mph: 23,
                     precipitation_inches: 1,
                     zip_code: 94127)

    visit '/conditions'

    expect(page).to have_content(32)
    expect(page).to have_content(94127)

    click_on "Delete"

    expect(page).to_not have_content(32)
    expect(page).to_not have_content(94127)
  end
end
