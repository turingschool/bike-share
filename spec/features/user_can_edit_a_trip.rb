require_relative '../spec_helper'

RSpec.describe 'When a user visits the edit page' do
  before do
    Station.create(lat: 37.329732, long: -121.90178200000001, name: 'Start Dummy', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
    Station.create(lat: 37.329732, long: -121.90178200000001, name: 'End Dummy', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
    Trip.create(duration: 22, start_date: start_date, end_date: end_date, subscription_type: 'subscriber', bike_id: 1, start_station_id: 1, end_station_id: 2, weather_id: 1)
  end
  it 'they should be able to edit a trip' do
    visit '/trips/1/edit'

    expect(page).to have_selector("input[value=22")
    expect(page).to have_selector("input[value=22")
  end
end