require 'spec_helper'

describe "when a visitor presses submit on new condition" do
  it 'visitor sees condition page' do

  visit '/conditions/new'

  fill_in 'condition[date]', with: '6/8/2013'
  fill_in 'condition[max_temperature]', with: 73
  fill_in 'condition[min_temperature]', with: 43
  fill_in 'condition[mean_temperature]', with: 58
  fill_in 'condition[mean_humidity]', with: 74
  fill_in 'condition[mean_wind_speed]', with: 9
  fill_in 'condition[mean_visibility]', with: 19
  fill_in 'condition[precipitation]', with: 1

  click_button 'submit'

  expect(current_path).to eq("/conditions/#{Condition.last.id}")

  expect(page).to have_content("73")
  expect(page).to have_content("Conditions")
  end
end
