require 'spec_helper'

describe "when a visitor edits a trip" do
  it 'visitor sees updated trip page' do

  Trip.create(duration: 40, start_date: "29/8/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)

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
