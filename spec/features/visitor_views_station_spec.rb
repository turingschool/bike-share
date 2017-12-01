require 'spec_helper'

describe "when a visitor selects a station" do
  it 'visitor sees station page' do

  station = Station.create(name: "Japantown", dock_count: 28, city: "San Francisco", installation_date: "6/8/2013")

  visit '/stations'

  click_link(station.name)

  expect(current_path).to eq("/stations/#{Station.first.id}")

  expect(page).to have_content("Japantown")
  expect(page).to have_no_content("All Stations")
  end
end
