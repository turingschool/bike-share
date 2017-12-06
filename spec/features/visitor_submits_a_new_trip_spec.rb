require 'spec_helper'

describe "when a visitor presses submit on new trip" do
  it 'visitor sees trip page' do

  visit '/trips/new'

  fill_in 'trip[duration]', with: 63
  fill_in 'trip[start_date]', with: "30/8/2013"
  fill_in 'trip[start_station_id]', with: 66
  fill_in 'trip[end_date]', with: '2013-08-29'
  fill_in 'trip[end_station_id]', with: 66
  fill_in 'trip[bike_id]', with: 379
  fill_in 'trip[subscription]', with: "Customer"
  fill_in 'trip[zip_code]', with: 38046

  click_button 'submit'

  expect(current_path).to eq("/trips/#{Trip.last.id}")

  expect(page).to have_content("Union Station")
  expect(page).to have_no_content("All Trips")
  end
end
