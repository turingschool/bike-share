require_relative '../spec_helper'

RSpec.describe 'When a user visits /trips' do

  attr_reader :start_date, :end_date
  before do
    @start_date = DateTime.strptime('8/29/2013 14:01', '%m/%d/%Y %k:%M')
    @end_date = DateTime.strptime('8/29/2013 14:23', '%m/%d/%Y %k:%M')

    Station.create(lat: 37.329732, long: -121.90178200000001, name: 'Start Dummy', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
    Station.create(lat: 37.329732, long: -121.90178200000001, name: 'End Dummy', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
    Trip.create(duration: 22, start_date: start_date, end_date: end_date, subscription_type: 'subscriber', bike_id: 1, start_station_id: 1, end_station_id: 2)

    visit '/trips'
  end

  it 'they should see a list of trips' do
    expect(page).to have_content('8/29/2013: Start Dummy -> End Dummy')
  end

  it 'should display 30 trips at a time' do
    DatabaseCleaner.clean
    31.times do |i|
      Station.create(lat: 37.329732, long: -121.90178200000001, name: "Start Dummy \##{i + 1}", dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
      Station.create(lat: 37.329732, long: -121.90178200000001, name: "End Dummy \##{i + 1}", dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
      Trip.create(duration: 22, start_date: start_date, end_date: end_date, subscription_type: 'subscriber', bike_id: 1, start_station_id: (i * 2) + 1, end_station_id: (i + 1) * 2)
    end

    visit '/trips'

    random = rand(30) + 1
    expect(page).to have_content("8/29/2013: Start Dummy ##{random} -> End Dummy ##{random}")
    expect(page).to_not have_content('8/29/2013: Start Dummy #31 -> End Dummy #31')

    click_on 'next'

    expect(page).to_not have_content("8/29/2013: Start Dummy ##{random} -> End Dummy ##{random}")
    expect(page).to have_content('8/29/2013: Start Dummy #31 -> End Dummy #31')
  end
end
