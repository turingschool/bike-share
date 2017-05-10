require_relative '../spec_helper'

RSpec.describe "user can see form for creating a new station" do
  it "will display the correct empty form" do
    Condition.create(date: "2013-11-22",
                                 max_temperature: 70,
                                 mean_temperature: 60,
                                 min_temperature: 50,
                                 mean_humidity: 20,
                                 mean_visibility: 2,
                                 mean_wind_speed: 10,
                                 precipitation: 12)

    visit('/conditions')
    click_on "Create New Conditions"

    expect(page).to have_content("Create New Conditions")
  end
end
