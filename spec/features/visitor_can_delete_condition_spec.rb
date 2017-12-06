require 'spec_helper'

describe "when a visitor visits the weather dashboard" do
  it 'visitor sees weather dashboard' do

    Condition.create(date: "6/8/2013", max_temperature: 75, mean_temperature: 68, min_temperature: 61, mean_humidity: 74, mean_visibility: 10, mean_wind_speed: 11, precipitation:0)

  visit '/conditions'

  expect(page).to have_content("Max Temperature")

  click_button 'delete'

  expect(current_path).to eq("/conditions")
  expect(Condition.all.count).to eq(0)

  end
end
