require_relative '../spec_helper'

RSpec.describe 'use can view an individual trips page' do
  it 'will display correct trips page' do
    customer = Customer.create(name: "Customer")
    customer.trips.create!(duration: 200,
                           start_date: "2000-8-12",
                           start_station_id: 1,
                           end_date: "2000-8-12",
                           end_station_id: 2,
                           bike_id: 13,
                           zip_code: 80220)

    visit("/trips/view_all")
    click_on "Additional Info"

    expect(current_path).to eq("/trips/#{trips.id}")
    expect(page).to have_content("80220")
    expect(page).to have_content("13")
  end
end
