require 'spec_helper'

describe "when a visitor visits station dashboard" do
  it 'visitor sees updated station page' do

  Station.create(name: "Japantown", dock_count: 28, city: "San Francisco", installation_date: "6/8/2013")

  visit '/station-dashboard'


  expect(current_path).to eq("/station-dashboard")
  expect(page).to have_content("Station Dashboard")
  end
end
