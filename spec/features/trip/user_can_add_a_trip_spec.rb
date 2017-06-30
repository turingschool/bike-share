require_relative "../../spec_helper"

RSpec.describe "when a user visits 'trips/new'" do
  it "they can create a new trip" do
    city = City.create(city: "Denver")
    city.stations.create(name: "Downtown", dock_count: 15, city: city, installation_date: "2013-08-05")
    city.stations.create(name: "Caphill", dock_count: 15, city: city, installation_date: "2013-08-05")
    Zipcode.create(zip_code: 94062)
    Subscription.create(subscription: "Customer")


    #when I visit
    visit '/trips/new'
    #and I fill in
    fill_in "trip[duration]", with: "23"
    fill_in "trip[start_station]", with: "Downtown"
    fill_in "trip[end_station]", with: "Caphill"
    fill_in "trip[zip_code]", with: "94062"
    fill_in "trip[bike_id]", with: "1"
    fill_in "trip[subscription]", with: "Customer"
    fill_in "trip[start_date]", with: "2013-08-29 14:13:00"
    fill_in "trip[end_date]", with: "2013-08-29 14:14:00"
    #and I click
    click_on("Create Trip")

    #and then I expect
    expect(current_path).to eq("/trips")

    #and then I expect
    expect(page).to have_content("23")
    expect(page).to have_content("Downtown")
    expect(page).to have_content("Caphill")
    expect(page).to have_content("1")
    expect(page).to have_content("Customer")
    expect(page).to have_content("2013-08-29 14:13:00")
    expect(page).to have_content("2013-08-29 14:14:00")

  end
end

#
# station = city.stations.create(name: "Japantown", dock_count: 15, city: city, installation_date: "2013-08-05")
# zipcode = Zipcode.create(zip_code: 94062)
# subscription = Subsciption.create(subscription: "Customer")
# trip = Trip.create(duration: 550, start_date: "6/18/14 17:08", start_station_id: 51, end_date: "6/18/14 17:17", end_station_id: 70, bike_id: 551, subscription_type: "Subscriber", zipcode_id: 1)
