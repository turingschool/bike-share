require_relative "../../spec_helper"

RSpec.describe "when a user visits '/trips/1' " do
  it "they can see a single trip" do
    #setup
    city = City.create(city: "Denver")
    start_station = city.stations.create(name: "Downtown", dock_count: 15, city: city, installation_date: "2013-08-05")
    end_station = city.stations.create(name: "Caphill", dock_count: 15, city: city, installation_date: "2013-08-05")
    zipcode = Zipcode.create(zip_code: 94062)
    subscription = Subscription.create(subscription: "Customer")
    trip = Trip.create(duration: 32, start_station: start_station, end_station: end_station, bike_id: 1, zipcode: zipcode, subscription: subscription, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:14:00")
    #when I visit
    visit('/trips/1')
    #I expect to be on
    expect(current_path).to eq('/trips/1')

    #I expect to see a welcome
    expect(page).to have_content("Trip Information")

    #I expect to see trip attributes
    expect(page).to have_content("32")
    expect(page).to have_content("Downtown")
    expect(page).to have_content("Caphill")
    expect(page).to have_content("1")
    expect(page).to have_content("94062")
    expect(page).to have_content("Customer")
    expect(page).to have_content("2013-08-29 14:13:00")
    expect(page).to have_content("2013-08-29 14:14:00")

  end
end
