require_relative "../spec_helper"

RSpec.describe "Creating a condition" do
  it "Can enter condition attributes" do

    visit "/conditions/new"

    fill_in "condition[date]", with: "20130829"
    fill_in "condition[max_temperature_f]", with: 85.0
    fill_in "condition[mean_temperature_f]", with: 80.0
    fill_in "condition[min_temperature_f]", with: 75.0
    fill_in "condition[mean_humidity]", with: 12
    fill_in "condition[mean_visibility_miles]", with: 2
    fill_in "condition[mean_wind_speed_mph]", with: 20.0
    fill_in "condition[precipitation_inches]", with: 2
    fill_in "condition[zip_code]", with: 94127

    click_on "Create New Weather"

    expect(current_path).to eq("/conditions")

    expect(page).to have_content("2013")
    expect(page).to have_content(75)
    expect(page).to have_content(12)
    expect(page).to have_content("94127")

  end
end
