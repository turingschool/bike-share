require_relative '../spec_helper'

RSpec.describe 'When a user visits /trips' do

  before do
    start_date = DateTime.strptime('8/29/2013 14:01', '%m/%d/%Y %k:%M')
    end_date = DateTime.strptime('8/29/2013 14:23', '%m/%d/%Y %k:%M')

    Station.create(lat: 37.329732, long: -121.90178200000001, name: 'Start Dummy', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
    Station.create(lat: 37.329732, long: -121.90178200000001, name: 'End Dummy', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
    Trip.create(duration: 22, start_date: start_date, end_date: end_date, subscription_type: 'subscriber', bike_id: 1, start_station_id: 1, end_station_id: 2, weather_id: 1)

    visit '/trips'
  end

  it 'they should see a list of trips' do
    expect(page).to have_content('8/29/2013: Start Dummy -> End Dummy')
  end
end
