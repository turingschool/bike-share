require './app/models/condition'

RSpec.describe "User visits /conditions/:id/edit" do
  it "when visiting /conditions" do
    Condition.create(date: "2013-08-29", max_temperature_f: 74.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, max_humidity: nil, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)

    visit "/conditions/1"

    expect(page).to have_content("2013-08-29")
    click_on("Edit this Condition")

    fill_in("date", with: "10/20/1990")
    fill_in("max_temperature_f", with: 10.0)
    fill_in("mean_temperature_f", with: 5.0)
    fill_in("min_temperature_f", with: 0.0)
    fill_in("max_humidity", with: 100.0)
    fill_in("mean_humidity", with: 0.0)
    fill_in("mean_visibility_miles", with: 8.0)
    fill_in("mean_wind_speed_mph", with: 40.0)
    fill_in("precipitation_inches", with: 20.0)
    click_on("Submit Changes")

    expect(page).to have_content("10/20/1990")
    expect(page).to have_content(10.0)
    expect(page).to have_content(5.0)
    expect(page).to have_content(8.0)

  end
end
