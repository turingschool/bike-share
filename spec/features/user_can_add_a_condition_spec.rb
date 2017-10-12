require "spec_helper"

RSpec.describe "When a user creates a condition '/conditions/new" do
  it "they can add a condition" do
    visit "/conditions/new"
    fill_in 'weather[date]',                   with: Date.new(2003,03,31)
    fill_in 'weather[max_temperature_f]',      with: 65
    fill_in 'weather[min_temperature_f]',      with: 35
    fill_in 'weather[mean_temperature_f]',     with: 50
    fill_in 'weather[mean_humidity]',          with: 3
    fill_in 'weather[mean_visibility_miles]',  with: 2
    fill_in 'weather[mean_wind_speed_mph]',    with: 10
    fill_in 'weather[precipitation_inches]',   with: 3
    fill_in 'weather[zip_code]',               with: 80214
    click_on "Add New Condition"

    expect(page).to have_content("Weather Conditions")
    expect(page).to have_content("03/31/2003")
  end
end
