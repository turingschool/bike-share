RSpec.describe "user edits trip" do
  it "with valid attributes" do
    zipcode = Zipcode.create(zipcode: "80202")

    trip = Trip.create(duration: 53, start_date_id: 2, end_date_id: 2, start_station_id: 3, end_station_id: 3, bike_id: 3, subscription_type: 'Subscriber', zipcode_id: 3)
    trip_2 = Trip.create(duration: 174, start_date_id: 1, end_date_id: 3, start_station_id: 2, end_station_id: 2, bike_id: 1, subscription_type: 'Customer', zipcode_id: 1)
    trip_3 = Trip.create(duration: 13, start_date_id: 3, end_date_id: 1, start_station_id: 1, end_station_id: 1, bike_id: 2, subscription_type: 'Customer', zipcode_id: 4)

    date = BikeShareDate.create(date: Date.strptime('1/1/2012', '%m/%d/%Y'))
    date_2 = BikeShareDate.create(date: Date.strptime('2/5/2017', '%m/%d/%Y'))
    date_3 = BikeShareDate.create(date: Date.strptime('4/12/2014', '%m/%d/%Y'))

    station_a = Station.create(name: "Alamo", dock_count: 2, installation_date_id: 2, city: "Lakewood")
    station_b = Station.create(name: "Boise", dock_count: 2, installation_date_id: 1, city: "Denver")
    station_c = Station.create(name: "Central", dock_count: 5, installation_date_id: 3, city: "Littleton")

    zipcode = Zipcode.create(zipcode: 80202)

    visit("/trips/2/edit")
    # save_and_open_page
    # fill_in("trip[bike_id]", with: 2)
    select("2", from: "trip[bike_id]")
    fill_in("trip[duration]", with: 174)
    fill_in("trip[start_date_id]", with: "1990-04-16")
    fill_in("trip[end_date_id]", with: "2016-05-16")
    select("Subscriber", from: "trip[subscription_type]")
    select("Boise", from: "trip[start_station_id]")
    select("Central", from: "trip[end_station_id]")
    fill_in("trip[zipcode_id]", with: 80202)

    click_button("Submit Changes")
    expect(current_path).to eq("/trips/2")
    expect(page).to have_content("Boise")
  end
end
