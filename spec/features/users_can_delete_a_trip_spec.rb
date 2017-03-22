require_relative '../spec_helper'

RSpec.describe 'When a user clicks delete' do
  before do
    start_date = DateTime.strptime('8/29/2013 14:01', '%m/%d/%Y %k:%M')
    end_date = DateTime.strptime('8/29/2013 14:23', '%m/%d/%Y %k:%M')
    Station.create(lat: 37.329732, long: -121.90178200000001, name: 'Start Dummy', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
    Station.create(lat: 37.329732, long: -121.90178200000001, name: 'End Dummy', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
    Trip.create(duration: 22, start_date: start_date, end_date: end_date, subscription_type: 'subscriber', bike_id: 1, start_station_id: 1, end_station_id: 2, weather_id: 2)
  end

  it 'should remove the trip' do
    visit '/trips/1'

    click_on 'Delete'

    expect(current_path).to eq('/trips')
    expect(Trip.find(1)).to be_nil
  end
end
