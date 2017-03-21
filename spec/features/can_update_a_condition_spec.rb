require_relative "../spec_helper"

RSpec.describe "Creating a condition" do
  it "Can enter condition attributes" do
    Condition.create(date: format_date("8/29/2013"),
                     max_temperature_f: 4,
                     mean_temperature_f: 6,
                     min_temperature_f: 32,
                     mean_humidity: 12,
                     mean_visibility_miles: 1,
                     mean_wind_speed_mph: 23,
                     precipitation_inches: 1,
                     zip_code: 94127)
    visit "/conditions"

    click_on "Edit"

    expect(current_path).to eq("/conditions/1/edit")

    fill_in "condition[date]", with: "8/29/2013"
    fill_in "condition[max_temperature_f]", with: 85.0
    fill_in "condition[mean_temperature_f]", with: 50.0
    fill_in "condition[min_temperature_f]", with: 25.0
    fill_in "condition[mean_humidity]", with: 12
    fill_in "condition[mean_visibility_miles]", with: 1
    fill_in "condition[mean_wind_speed_mph]", with: 30.0
    fill_in "condition[precipitation_inches]", with: 2
    fill_in "condition[zip_code]", with: 94127

    click_on "Update Condition"

    expect(current_path).to eq("/conditions")

    expect(page).to have_content(50.0)
    expect(page).to_not have_content(80.0)
    expect(page).to have_content(12)
    expect(page).to have_content(94127)

  end
end
