require 'spec_helper'

describe "when a visitor visits weather dashboard" do
  it 'visitor sees updated weather page' do

  Condition.create(date: "6/8/2013", max_temperature: 75, mean_temperature: 68, min_temperature: 61, mean_humidity: 74, mean_visibility: 10, mean_wind_speed: 11, precipitation:0)


  visit '/condition-dashboard'

  expect(current_path).to eq("/condition-dashboard")
  expect(page).to have_content("Conditions")
  expect(Condition.all.count).to eq(1)
  end
end
