require_relative '../spec_helper'

RSpec.describe 'When a user visits the edit page' do

  attr_reader :start_date, :end_date

  before do
    @start_date = DateTime.strptime('8/29/2013 14:01', '%m/%d/%Y %k:%M')
    @end_date = DateTime.strptime('8/29/2013 14:23', '%m/%d/%Y %k:%M')
    Station.create(lat: 37.329732, long: -121.90178200000001, name: 'Start Dummy', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
    Station.create(lat: 37.329732, long: -121.90178200000001, name: 'End Dummy', dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
    Trip.create(duration: 22, start_date: start_date, end_date: end_date, subscription_type: 'subscriber', bike_id: 1, start_station_id: 1, end_station_id: 2, weather_id: 2)
  end

  it 'they should be able to edit a trip' do
    visit '/trips/1/edit'

    expect(page).to have_selector("input[value='22']")
    expect(page).to have_selector("input[value='8/29/2222 13:43']")
    expect(page).to have_selector("input[value='8/29/2222 13:43']")
    find(:css, '#subscriber').should be_checked
    find('#bike_select').find(:xpath, 'option[1]').should be_selected
    find('#weather_select').find(:xpath, 'option[2]').should be_selected
    find('#start_station_select').find(:xpath, 'option[1]').should be_selected
    find('#end_station_select').find(:xpath, 'option[2]').should be_selected

    fill_in "trip[duration]", with: 11
    fill_in "trip[start_date]", with: '1/1/2002 9:01'
    fill_in "trip[end_date]", with: '2/2/1982 23:45'
    choose "subscriber"
    find('#bike_select').find(:xpath, 'option[2]').select_option
    find('#weather_select').find(:xpath, 'option[1]').select_option
    find('#start_station_select').find(:xpath, 'option[2]').select_option
    find('#end_station_select').find(:xpath, 'option[1]').select_option

    click_on "Update"

    expect(current_path).to eq('/trips/1')

    expect(page).to have_content('Duration: 11')
    expect(page).to have_content('Start date: 1/1/2002 9:01')
    expect(page).to have_content('End date: 2/2/1982 23:45')
    expect(page).to have_content('Fake bike!')
    expect(page).to have_content('Fake weather!')
    expect(page).to have_content('Start station: Start Dummy')
    expect(page).to have_content('End station: End Dummy') #<- should these be links?
  end
end
