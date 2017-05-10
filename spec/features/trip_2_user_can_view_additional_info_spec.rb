require_relative '../spec_helper'

RSpec.describe 'use can view an individual trips page' do
  it 'will display correct trips page' do
    city = City.create(name: "San Jose")
    city.stations.create(name: "MLK Station", dock_count: 19, city_id: 1, installation_date: "2013-5-11")
    city.stations.create(name: "Cesar Chavez Station", dock_count: 5, city_id: 1, installation_date: "2013-5-19")
    start_station = StartStation.create(station_id: 2)
    end_station = EndStation.create(station_id: 1)
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

    visit("/trips/view_all")
    click_on "Additional Info"

    expect(current_path).to eq("/trips/1")
    expect(page).to have_content("80218")
    expect(page).to have_content("122")
  end
end
