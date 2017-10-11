require "spec_helper"

RSpec.describe "When a user creates a condition '/conditions/new" do
  it "they can add a condition" do
    visit "/conditions/new"
    fill_in 'weather[date]',                    with: Date.today
    fill_in 'weather[max_temperature_f]',       with: 65
    fill_in 'weather[min_temperature_f]',       with: 35
    fill_in 'weather[mean_temperature_f]',     with: 50
    fill_in 'weather[mean_humidity]',          with: 3
    fill_in 'weather[mean_visibility_miles]',  with: 2
    fill_in 'weather[mean_wind_speed_mph]',    with: 10
    fill_in 'weather[precipitation_inches]',   with: 3
    fill_in 'weather[zip_code]',               with: 80214
    click_on "Add New Trip"

    expect(page).to have_content("65")
    expect(page).to have_content("35")
    expect(page).to have_content("50")
    expect(page).to have_content("3")
    expect(page).to have_content("2")
    expect(page).to have_content("10")
    expect(page).to have_content("3")
    expect(page).to have_content("80214")
  end
end
