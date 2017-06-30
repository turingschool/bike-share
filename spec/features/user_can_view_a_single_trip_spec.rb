require_relative '../spec_helper'

RSpec.describe "When a user visits a single trip" do

  attr_reader :start_date, :end_date
  before do
    @start_date = DateTime.strptime('8/29/2013 14:01', '%m/%d/%Y %k:%M')
    @end_date = DateTime.strptime('8/29/2013 14:23', '%m/%d/%Y %k:%M')

    Station.create(lat: 37.329732, long: -121.90178200000001, name: 'Start Dummy', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
    Station.create(lat: 37.329732, long: -121.90178200000001, name: 'End Dummy', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
    Trip.create(duration: 22, start_date: start_date, end_date: end_date, subscription_type: 'subscriber', bike_id: 1, start_station_id: 1, end_station_id: 2)

    visit '/trips/1'
  end

  it 'they can see a single trips duration' do
    expect(page).to have_content('Duration: 22')
  end

  it 'they can see a single trips start_date' do
    expect(page).to have_content('Start Date: 2013-08-29 14:01:00 UTC')
  end

  it 'they can see a single trips end_date' do
    expect(page).to have_content('End Date: 2013-08-29 14:23:00 UTC')
  end

  it 'they can choose customer/subscriber selector' do
    expect(page).to have_content('Subscryption Type: subscriber')

    # expect(page).to have_content(subscription_type: 'customer')
  end

  it 'they can see a single trips bike' do
    expect(page).to have_content('Bike: 1')
  end

  it 'they can see a single trips start_station' do
    expect(page).to have_content('Start Station: Start Dummy')
  end

  it 'they can see a single trips end_station' do
    expect(page).to have_content('End Station: End Dummy')
  end

  # it 'they can see a single trips weather' do
  #   expect(page).to have_content('Weather')
  # end
end
