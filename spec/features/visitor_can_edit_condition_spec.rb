require 'spec_helper'

describe "when a visitor edits a condition" do
  it 'visitor sees updated condition page' do

    Condition.create(date: "6/8/2013", max_temperature: 75, mean_temperature: 68, min_temperature: 61, mean_humidity: 74, mean_visibility: 10, mean_wind_speed: 11, precipitation:0)

  visit '/conditions'

  click_link('Edit')

  expect(current_path).to eq("/conditions/#{Condition.first.id}/edit")
  expect(page).to have_content("Edit Condition")

  fill_in 'condition[max_temperature]', with: 80

  click_button 'submit'

  expect(current_path).to eq("/conditions/#{Condition.first.id}")
  expect(Condition.first.max_temperature).to eq(80)
  end
end
