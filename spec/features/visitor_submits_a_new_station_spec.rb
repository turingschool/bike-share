require 'spec_helper'

describe "when a visitor presses submit on new station" do
  it 'visitor sees station page' do

  visit '/stations/new'

  fill_in 'station[name]', with: 'Union Station'
  fill_in 'station[dock_count]', with: 20
  fill_in 'station[city]', with: 'Denver'
  fill_in 'station[installation_date]', with: '05/08/2013'

  click_button 'submit'

  expect(current_path).to eq("/stations/#{Station.last.id}")

  expect(page).to have_content("Union Station")
  expect(page).to have_no_content("All Stations")
  end
end
