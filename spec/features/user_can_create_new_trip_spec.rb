require_relative "../spec_helper"

RSpec.describe "When a user creates a trip" do
  before :each do
    city = City.create(name: "Denver")
    trip1 = city.stations.create(name: "Turing", dock_count: 100, installation_date: "3/14/2017")
    station2 = city.stations.create(name: "Galvanize", dock_count: 1, installation_date: "4/01/1972")
    bike = Bike.create(bike_number: 33)
    subscription_type = SubscriptionType.create(subscription_type: "Subscription")
    zip_code = ZipCode.create(zip_code: 80602)
    trip1 = bike.trips.create(duration: 100, start_date: "8/29/2013 14:14", start_station_id: station1.id, end_date: "8/29/2013 20:14", end_station_id: station2.id, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
    trip2 = bike.trips.create(duration: 200, start_date: "1/20/2013 10:14", start_station_id: station2.id, end_date: "10/29/2014 12:14", end_station_id: station1.id, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
  end
  it "the trip shows up in the index" do

    visit '/trips/new'
    fill_in 'trip[duration]', with: 111
    fill_in 'trip[start_date]', with: "8/29/2013 14:14"
    fill_in 'trip[end_date]', with: "8/29/2013 15:14"
    fill_in 'trip[start_station]', with: 'Turing'
    fill_in 'trip[end_station]', with: 'Galvanize'
    fill_in 'trip[subscription_type]', with: 'Customer'
    fill_in 'trip[zip_code]', with: '80017'

    click_on 'Submit'

    expect(current_path).to eq '/trips'
    expect(page).to have_content 'Trip ID: 3'
    expect(page).to have_content 'Start Date: 8/29/2013 14:14'
    expect(page).to have_content 'Start Station: Turing'
    expect(page).to have_content 'End Date: 8/29/2013 15:14'
    expect(page).to have_content 'End Station: Galvanize'
    expect(page).to have_content 'Subscription Type: Customer'
    expect(page).to have_content 'Zip Code: 80017'
  end
end
