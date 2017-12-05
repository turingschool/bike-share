require 'spec_helper'

describe "when a visitor visits the trip-dashboard" do
  it 'visitor sees dashboard' do

  Trip.create(duration: 40, start_date: "29/8/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)

  visit '/trips'

  expect(page).to have_content("Golden Gate at Polk")

  click_button 'delete'

  expect(current_path).to eq("/trips")
  expect(Station.all.count).to eq(0)

  end
end
