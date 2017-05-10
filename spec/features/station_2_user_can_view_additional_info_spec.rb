require_relative '../spec_helper'

RSpec.describe 'use can view an individual stations page' do
  it 'will display correct stations page' do
    city = City.create(name: "Perth")
    city = City.create(name: "Vancover")
    StartStation.create(station_id: 1)
    EndStation.create(station_id: 1)
    subscription_type = SubscriptionType.create(name: "Customer")
    ride_date = RideDate.find_or_create_by(day: 12, month: 8, year: 2012)
    StartDate.create(ride_date_id: 1)
    EndDate.create(ride_date_id: 1)
    trip = subscription_type.trips.create(duration: 400,
                              start_station_id: 1,
                              end_station_id: 1,
                              start_date_id: 1,
                              end_date_id: 1,
                              bike_id: 122,
                              zip_code: 80218)
    city.stations.create(name: "MLK", dock_count: 22, installation_date: "2011-11-12")

    visit("/stations/view_all")
    click_on "Additional Info"

    expect(current_path).to eq("/stations/1")
    expect(page).to have_content("MLK")
    expect(page).to have_content("Edit")
  end
end
