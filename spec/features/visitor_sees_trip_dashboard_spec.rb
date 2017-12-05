require 'spec_helper'

describe "when a visitor visits trip dashboard" do
  it 'visitor sees updated trip page' do

  Trip.create(duration: 40, start_date: "29/8/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)

  visit '/trip-dashboard'


  expect(current_path).to eq("/trip-dashboard")
  expect(page).to have_content("Trip Dashboard")
  end
end
