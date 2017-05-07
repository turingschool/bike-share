require_relative '../spec_helper'

RSpec.describe 'when a user visits the all trips page' do
  it 'displays all trips' do
    customer = Customer.create(name: "Customer")
    customer.trips.create!(duration: 200,
                           start_date: "2000-8-12",
                           start_station_id: 1,
                           end_date: "2000-8-12",
                           end_station_id: 2,
                           bike_id: 13,
                           zip_code: 80220)

    visit('/trips')
    click_on "View Trips"

    expect(page).to have_content("80220")
    expect(current_path).to eq('/trips/view_all')
  end
end
