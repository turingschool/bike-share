require_relative "../../spec_helper"

RSpec.describe "when a user visits 'trips/new'" do
  it "they can create a new trip" do

    #when I visit
    visit '/trips/new'
    #and I fill in
    fill_in "trip[duration]", with: "23"
    fill_in "trip[start_station]", with: "Denver"
    # binding.pry
    fill_in "trip[end_station]", with: "Boulder"
    fill_in "trip[bike_id]", with: "1"
    fill_in "trip[subscription]", with: "Subcriber"
    fill_in "trip[start_date]", with: "8/29/2013 14:14"
    fill_in "trip[end_date]", with: "8/29/2013 14:37"
    #and I click
    click_on("Create Trip")

    #and then I expect
    expect(current_path).to eq("/trips")

    #and then I expect
    expect(page).to have_content("23")
    expect(page).to have_content("Denver")
    expect(page).to have_content("Boulder")
    expect(page).to have_content("1")
    expect(page).to have_content("Subscriber")
    expect(page).to have_content("8/29/2013 14:14")
    expect(page).to have_content("8/29/2013 14:37")

  end
end


station = city.stations.create(name: "Japantown", dock_count: 15, city: city, installation_date: "2013-08-05")
zipcode = Zipcode.create(zip_code: 94062)
subscription = Subsciption.create(subscription: "Customer")
trip = Trip.create(duration: 550, start_date: "6/18/14 17:08", start_station_id: 51, end_date: "6/18/14 17:17", end_station_id: 70, bike_id: 551, subscription_type: "Subscriber", zipcode_id: 1)
