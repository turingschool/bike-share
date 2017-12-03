require 'spec_helper'

describe "as a visitor, when I visit '/conditions/new'" do
  before :each do
    visit '/conditions/new'
  end

  it "I expect to see a form to create a new condition" do
    expect(page.status_code).to eq(200)

    fill_in "condition[date]", with: "2013-08-07"
    fill_in "condition[max_temperature_f]", with: 80
    fill_in "condition[mean_temperature_f]", with: 70
    fill_in "condition[min_temperature_f]", with: 60
    fill_in 'condition[mean_humidity]', :with => 20
    fill_in 'condition[mean_visibility_miles]', :with => 30
    fill_in 'condition[mean_wind_speed_mph]', :with => 20
    fill_in 'condition[precipitation_inches]', :with => 4
    fill_in 'condition[zip_code]', :with => 93019

    click_on("Submit")

    expect(current_path).to eq("/conditions/#{Condition.last.id}")

    expect(page).to have_content(80)
  end
end
