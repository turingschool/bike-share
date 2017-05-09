require_relative '../spec_helper'

RSpec.describe 'when a user visits the all conditions page' do
  it 'they can see conditions' do
    Condition.create(date: "2013-11-22",
                                 max_temperature: 70,
                                 mean_temperature: 60,
                                 min_temperature: 50,
                                 mean_humidity: 20,
                                 mean_visibility: 2,
                                 mean_wind_speed: 10,
                                 precipitation: 12)

    visit('/conditions')
    click_on "View Conditions"

    expect(page).to have_content("70")
    expect(current_path).to eq('/conditions/view_all')
  end
end
