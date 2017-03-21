require_relative "../../spec_helper"

RSpec.describe "When a user creates a trip" do
  before :each do
    city = City.create(name: "Denver")
    station1 = city.stations.create(name: "Turing", dock_count: 100, installation_date: "14/3/2017")
    station2 = city.stations.create(name: "Galvanize", dock_count: 1, installation_date: "1/4/1972")
    bike = Bike.create(bike_number: 33)
    subscription_type = SubscriptionType.create(subscription_type: "Subscriber")
    zip_code = ZipCode.create(zip_code: 80602)
    trip1 = bike.trips.create(duration: 100, start_date: "29/8/2013 14:14", start_station_id: station1.id, end_date: "29/8/2013 20:14", end_station_id: station2.id, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
    trip2 = bike.trips.create(duration: 200, start_date: "20/1/2013 10:14", start_station_id: station2.id, end_date: "29/10/2014 12:14", end_station_id: station1.id, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
  end
  it "the trip shows up in the index" do

    visit '/trips/new'
    fill_in 'trip[duration]', with: 111
    fill_in 'trip[start_date]', with: Time.parse("2013-8-29 14:14 UTC")
    fill_in 'trip[end_date]', with: Time.parse("2013-8-29 15:14 UTC")
    select('Turing', :from =>'trip[start_station]')
    select('Galvanize', :from =>'trip[end_station]')
    select('Subscriber', :from =>'trip[subscription_type]')
    fill_in 'trip[bike_number]', with: '33'

    click_on 'Submit'


    expect(current_path).to eq '/trips/3'
    expect(page).to have_content 'Trip ID: 3'
    expect(page).to have_content 'Start Date: Thursday, August 29, 2013 @ 02:14pm'
    expect(page).to have_content 'Start Station: Turing'
    expect(page).to have_content 'End Date: Thursday, August 29, 2013 @ 03:14pm'
    expect(page).to have_content 'End Station: Galvanize'
    expect(page).to have_content 'Subscription Type: Subscriber'
    expect(page).to have_content 'Bike Number: 33'
  end
end
