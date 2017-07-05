RSpec.describe "user visits trips index" do
  it "and they see list of all the trips" do
    trip = Trip.create(duration: 53, start_date_id: 2, end_date_id: 2, start_station_id: 3, end_station_id: 3, bike_id: 3, subscription_type: 'Subscriber', zipcode_id: 1)
    trip_2 = Trip.create(duration: 174, start_date_id: 1, end_date_id: 3, start_station_id: 2, end_station_id: 2, bike_id: 1, subscription_type: 'Customer', zipcode_id: 1)
    trip_3 = Trip.create(duration: 13, start_date_id: 3, end_date_id: 1, start_station_id: 1, end_station_id: 1, bike_id: 2, subscription_type: 'Customer', zipcode_id: 1)

    date = BikeShareDate.create(date: Date.strptime('1/1/2012', '%m/%d/%Y'))
    date_2 = BikeShareDate.create(date: Date.strptime('2/5/2017', '%m/%d/%Y'))
    date_3 = BikeShareDate.create(date: Date.strptime('2/21/2017', '%m/%d/%Y'))

    station_a = Station.create(name: "A", dock_count: 1, installation_date_id: 1, city: "Chicago")
    station_b = Station.create(name: "B", dock_count: 2, installation_date_id: 2, city: "Denver")
    station_c = Station.create(name: "C", dock_count: 2, installation_date_id: 3, city: "New York")
    zipcode = Zipcode.create(zipcode: 80202)

    visit("/trips")
    save_and_open_page
    expect(page).to have_content(trip.duration)
    expect(page).to have_content(trip.start_date_id)
    expect(page).to have_content(trip_2.start_station_id)
    expect(page).to have_content(trip.end_date_id)
    expect(page).to have_content(trip_3.end_station_id)
    expect(page).to have_content(trip_3.end_station_id)
    expect(page).to have_content(trip.subscription_type)
    expect(page).to have_content(80202)
  end
end
