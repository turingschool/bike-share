require_relative '../spec_helper'

RSpec.describe 'use can view an individual conditions page' do
  it 'will display correct conditions page' do
    Condition.create(date: "2013-11-22",
                                 max_temperature: 70,
                                 mean_temperature: 60,
                                 min_temperature: 50,
                                 mean_humidity: 20,
                                 mean_visibility: 2,
                                 mean_wind_speed: 10,
                                 precipitation: 12)

    visit("/conditions/view_all")
    click_on "Additional Info"

    expect(current_path).to eq("/conditions/1")
    expect(page).to have_content("70")
    expect(page).to have_content("Edit")
  end
end
