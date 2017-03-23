require_relative '../spec_helper'

RSpec.describe 'When a user visits /trips-dashboard' do

  it 'they should see a bunch of analytics' do

    start_station_1 = Station.create(lat: 37.329732, long: -121.90178200000001, name: 'Start Dummy 1', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
    end_station_1 = Station.create(lat: 37.329732, long: -121.90178200000001, name: 'End Dummy 1', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
    start_station_2 = Station.create(lat: 37.329732, long: -121.90178200000001, name: 'Start Dummy 2', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
    end_station_2 = Station.create(lat: 37.329732, long: -121.90178200000001, name: 'End Dummy 2', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))

    day1 = DateTime.strptime('8/27/2012 14:01', '%m/%d/%Y %k:%M')
    day2 = DateTime.strptime('8/28/2012 14:23', '%m/%d/%Y %k:%M')
    day3 = DateTime.strptime('8/29/2012 14:23', '%m/%d/%Y %k:%M')
    end_date = DateTime.strptime('8/29/2013 14:23', '%m/%d/%Y %k:%M')

    trip1 = Trip.create(duration: 22, start_date: day1, end_date: end_date, subscription_type: 'subscriber', start_station: start_station_1, end_station: end_station_1)
    trip2 = Trip.create(duration: 1, start_date: day1, end_date: end_date, subscription_type: 'subscriber', start_station: start_station_2, end_station: end_station_2)
    trip3 = Trip.create(duration: 222, start_date: day1, end_date: end_date, subscription_type: 'subscriber', start_station: start_station_2, end_station: end_station_2)
    trip4 = Trip.create(duration: 202, start_date: day2, end_date: end_date, subscription_type: 'subscriber')
    trip5 = Trip.create(duration: 212, start_date: day2, end_date: end_date, subscription_type: 'customer')
    trip6 = Trip.create(duration: 2, start_date: day3, end_date: end_date, subscription_type: 'customer')

    bike1 = Bike.create(bin:1)
    bike2 = Bike.create(bin:2)

    bike1.trips << trip1
    bike2.trips << trip2
    bike2.trips << Trip.create(duration: 24, start_date: end_date, end_date: day3, subscription_type: 'subscriber', start_station_id: 1, end_station_id: 2)

    visit '/trips-dashboard'

    expect(page).to have_content('Average trip length: ')
    within('li.longest-trips') do
      expect(page).to have_content(trip3.make_name)
    end

    within('li.shortest-trips') do
      expect(page).to have_content(trip2.make_name)
    end


    within('li.popular-start-stations') do
      expect(page).to have_content('Start Dummy 2')
    end

    within('li.popular-end-stations') do
      expect(page).to have_content('End Dummy 2')
    end

    expect(page).to have_content('Highest number of times one bike was ridden: 2')
    within('li.most-popular-bikes') do
      expect(page).to have_content('Bike ID: 2')
    end

    expect(page).to have_content('Fewest number of times one bike was ridden: 1')
    within('li.least-popular0bikes') do
      expect(page).to have_content('Bike ID: 1')
    end

    expect(page).to have_content('Total subscribers: 4')
    expect(page).to have_content('Percentage of subscribers: 66%')
    expect(page).to have_content('Total customers: 2')
    expect(page).to have_content('Percentage of customers: 33%')
  end
end
