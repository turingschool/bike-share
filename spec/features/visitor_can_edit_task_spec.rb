require 'spec_helper'

describe "when a visitor edits a station" do
  it 'visitor sees updated station page' do

  station = Station.create(name: "Japantown", dock_count: 28, city: "San Francisco", installation_date: "6/8/2013")

  visit '/stations'

  click_link('Edit')

  expect(current_path).to eq("/stations/#{Station.first.id}/edit")
  expect(page).to have_content("Edit Station")

  fill_in 'station[dock_count]', with: 20

  click_button 'submit'

  expect(current_path).to eq("/stations/#{Station.first.id}")
  expect(Station.first.dock_count).to eq(20)
  end
end
