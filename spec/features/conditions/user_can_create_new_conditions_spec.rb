require_relative "../../spec_helper"

RSpec.describe "When a user creates conditions for a date" do
  it "the conditions show up in the index" do

    visit '/conditions/new'
    fill_in 'condition[date]', with: '29/7/2013'
    fill_in 'condition[max_temp]', with: 80
    fill_in 'condition[min_temp]', with: 70
    fill_in 'condition[mean_temp]', with: 75
    fill_in 'condition[mean_humidity]', with: 80
    fill_in 'condition[mean_visibility]', with: 5
    fill_in 'condition[mean_wind_speed]', with: 12
    fill_in 'condition[precipitation]', with: 0.01

    click_on 'Submit'

    expect(current_path).to eq '/conditions/1'
    expect(page).to have_content '80'
    expect(page).to have_content '12'
  end
end
