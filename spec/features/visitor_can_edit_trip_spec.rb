require 'spec_helper'

describe "when a visitor edits a trip" do
  it 'visitor sees updated trip page' do

  Trip.create(duration: 63, start_date: "30/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Subscriber", zip_code: 94127)

  visit '/trips'

  click_link('Edit')

  expect(current_path).to eq("/trips/#{Trip.first.id}/edit")
  expect(page).to have_content("Edit Trip")

  fill_in 'trip[duration]', with: 60

  click_button 'submit'

  expect(current_path).to eq("/trips/#{Trip.first.id}")
  expect(Trip.first.duration).to eq(60)
  end
end
