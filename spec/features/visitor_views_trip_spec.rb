require 'spec_helper'

describe "when a visitor selects a trip" do
  it 'visitor sees trip page' do

  trip = Trip.create(duration: 40, start_date: "29/8/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)

  visit '/trips'

  click_link(trip.id)

  expect(current_path).to eq("/trips/#{Trip.first.id}")

  expect(page).to have_content("Golden Gate at Polk")
  expect(page).to have_no_content("All Trips")
  end
end
