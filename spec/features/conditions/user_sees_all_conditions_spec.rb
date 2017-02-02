require_relative '../../spec_helper'

RSpec.describe "When a user visits conditions index" do

  it "they see list of all weather conditions" do
    Condition.create(date: "9/2/2013",
                     max_temperature_f: 78,
                     mean_temperature_f: 73,
                     min_temperature_f: 67,
                     mean_humidity: 43,
                     mean_visibility_miles: 11,
                     mean_wind_speed_mph: 12,
                     precipitation_inches: 0)
    Condition.create(date: "8/4/2013",
                     max_temperature_f: 78,
                     mean_temperature_f: 73,
                     min_temperature_f: 67,
                     mean_humidity: 43,
                     mean_visibility_miles: 11,
                     mean_wind_speed_mph: 12,
                     precipitation_inches: 0)
    visit('/conditions')

    #save_and_open_page
    expect(page).to have_content("9/2/2013")
    expect(page).to have_content("8/4/2013")
  end

end