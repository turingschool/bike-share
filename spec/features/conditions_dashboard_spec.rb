require "spec_helper"

RSpec.describe "when a user visits '/condition-dashboard'" do
  it "they can see dashboard metrics" do

    Condition.create!(
    date: Date.new(2013,8,28),
    max_temperature_f: 70,
    min_temperature_f: 40,
    mean_temperature_f: 60,
    mean_humidity: 30,
    mean_visibility_miles: 10,
    mean_wind_speed_mph: 4 ,
    precipitation_inches: 1,
    zip_code: 95234)

    visit "/condition-dashboard"

    expect(page).to have_content("Weather Dashboard")
    expect(page).to have_content("Wind Speed")
    expect(page).to have_content("Precipitation")
  end
end
