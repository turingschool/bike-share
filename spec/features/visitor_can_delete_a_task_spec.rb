require 'spec_helper'

describe "when a visitor visits the dashboard" do
  it 'visitor sees dashboar' do

  station = Station.create(name: "Japantown", dock_count: 28, city: "San Francisco", installation_date: "6/8/2013")

  visit '/stations'

  expect(page).to have_content("Japantown")

  click_button 'delete'

  expect(current_path).to eq("/stations")
  expect(Station.all.count).to eq(0)

  end
end
