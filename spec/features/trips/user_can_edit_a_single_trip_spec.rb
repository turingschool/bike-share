require_relative "../../spec_helper"

RSpec.describe "When a user edits a trip" do
  before :each do
    city = City.create(name: "Denver")
    station1 = city.stations.create(name: "Turing", dock_count: 100, installation_date: "3/14/2017")
    station2 = city.stations.create(name: "Galvanize", dock_count: 1, installation_date: "4/01/1972")
    bike = Bike.create(bike_number: 33)
    subscription_type = SubscriptionType.create(subscription_type: "Subscriber")
    SubscriptionType.create(subscription_type: "Customer")
    zip_code = ZipCode.create(zip_code: 80602)
    @trip1 = bike.trips.create(duration: 100, start_date: "8/29/2013 14:14", start_station_id: station1.id, end_date: "8/29/2013 20:14", end_station_id: station2.id, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
  end
  it "the trips duration is changed" do

    visit '/trips/1/edit'
    fill_in 'trip[duration]', with: '316'
    select('Customer', :from =>'trip[subscription_type]')
    click_on 'Submit'

    expect(current_path).to eq '/trips/1'
    expect(page).to have_content '316'
    expect(page).to_not have_content '100'
    expect(page).to have_content 'Subscription Type: Customer'
    expect(page).to_not have_content 'Subscription Type: Subscriber'
  end
end
