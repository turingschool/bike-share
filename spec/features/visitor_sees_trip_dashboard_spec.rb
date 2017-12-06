require 'spec_helper'

describe "when a visitor visits trip dashboard" do
  it 'visitor sees updated trip page' do

  Trip.create(duration: 63, start_date: "30/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Subscriber", zip_code: 94127)

  visit '/trip-dashboard'


  expect(current_path).to eq("/trip-dashboard")
  expect(page).to have_content("Trip Dashboard")
  end
end
