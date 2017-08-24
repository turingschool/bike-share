require './app/models/condition'

RSpec.describe "when visiting '/conditions'" do
  it "deletes a weather condition from the list" do
    Condition.create(date: "2013-08-29", max_temperature_f: 74.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, max_humidity: nil, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)

    visit '/conditions'

    expect(page).to have_content("2013-08-29")
    expect(page).to have_content(74.0)

    click_button("Delete")

    expect(page).to_not have_content("2013-08-29")
    expect(page).to_not have_content(74.0)
  end
end
