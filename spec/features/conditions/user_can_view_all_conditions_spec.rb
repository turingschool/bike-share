require './app/models/condition'

RSpec.describe "User visits '/conditions'" do
  it "sees information on all conditions" do
    Condition.create(date: "2013-08-29", max_temperature_f: 74.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, max_humidity: nil, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)
    Condition.create(date: "2013-08-30", max_temperature_f: 78.0, mean_temperature_f: 69.0, min_temperature_f: 60.0, max_humidity: nil, mean_humidity: 70.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 13.0, precipitation_inches: 0.0)
    Condition.create(date: "2013-08-31", max_temperature_f: 71.0, mean_temperature_f: 64.0, min_temperature_f: 57.0, max_humidity: nil, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 15.0, precipitation_inches: 0.0)
    Condition.create(date: "2013-09-01", max_temperature_f: 74.0, mean_temperature_f: 66.0, min_temperature_f: 58.0, max_humidity: nil, mean_humidity: 68.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 13.0, precipitation_inches: 0.0)

    visit '/conditions'

    expect(page).to have_content("2013-08-29")
    expect(page).to have_content("2013-08-30")
    expect(page).to have_content("2013-08-31")
    expect(page).to have_content("2013-09-01")
  end
end
