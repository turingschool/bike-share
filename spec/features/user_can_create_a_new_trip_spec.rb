require_relative '../spec_helper'

RSpec.describe "When a user visits '/trips/new'" do

  attr_reader :start_date, :end_date
  before do
    @start_date = DateTime.strptime('8/29/2013 14:01', '%m/%d/%Y %k:%M')
    @end_date = DateTime.strptime('8/29/2013 14:23', '%m/%d/%Y %k:%M')

    Station.create(lat: 37.329732, long: -121.90178200000001, name: 'Start Dummy', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
    Station.create(lat: 37.329732, long: -121.90178200000001, name: 'End Dummy', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
    Trip.create(duration: 22, start_date: start_date, end_date: end_date, subscription_type: 'subscriber', bike_id: 1, start_station_id: 1, end_station_id: 2, weather_id: 1)

    visit '/trips/new'
  end

  it 'they can create a new trip on this page' do

    visit '/trips/new'

    fill_in "trip[duration]", with: 00
    fill_in "trip[start_date]", with: start_date
    fill_in "trip[end_date]", with: end_date
    choose "subscriber"
    # fill_in "trip[bike]", with: 1
    # fill_in "trip[weather]", with: 87
    find('#bike_select').find(:xpath, 'option[1]').select_option
    find('#bike_select').find(:xpath, 'option[1]').select_option
    find('#start_station_select').find(:xpath, 'option[1]').select_option
    find('#end_station_select').find(:xpath, 'option[2]').select_option

    click_on "Create"

    expect(current_path).to eq('/trips')
    expect(page).to have_content('8/29/2013: Start Dummy -> End Dummy')
  end
end
