RSpec.describe 'user creates a new trip' do
  it "and sees the show page for their new trip" do
    zipcode = Zipcode.create(zipcode: "80202")

    trip = Trip.create(duration: 53, start_date_id: 2, end_date_id: 2, start_station_id: 3, end_station_id: 3, bike_id: 3, subscription_type: 'User', zipcode_id: 1)
    trip_2 = Trip.create(duration: 174, start_date_id: 1, end_date_id: 3, start_station_id: 2, end_station_id: 2, bike_id: 1, subscription_type: 'User', zipcode_id: 1)
    trip_3 = Trip.create(duration: 13, start_date_id: 3, end_date_id: 1, start_station_id: 1, end_station_id: 1, bike_id: 2, subscription_type: 'User', zipcode_id: 1)

    date = BikeShareDate.create(date: Date.strptime('1/1/2012', '%m/%d/%Y'))
    date_2 = BikeShareDate.create(date: Date.strptime('2/5/2017', '%m/%d/%Y'))
    date_3 = BikeShareDate.create(date: Date.strptime('2/21/2017', '%m/%d/%Y'))

    station_a = Station.create(name: "A", dock_count: 1, installation_date_id: 1, city: "Chicago")
    station_b = Station.create(name: "B", dock_count: 2, installation_date_id: 2, city: "Denver")
    station_c = Station.create(name: "C", dock_count: 2, installation_date_id: 3, city: "New York")

    visit('/trips')

    expect(page).to_not have_content("67")

    visit('/trips/new')

    fill_in('trip[duration]', with: 67)
    fill_in('trip[start_date_id]', with: Date.strptime('1/1/2012', '%m/%d/%Y'))
    page.select 'A', from: 'trip[start_station_id]'
    fill_in('trip[end_date_id]', with: Date.strptime('2/5/2017', '%m/%d/%Y'))
    page.select 'B', from: 'trip[end_station_id]'
    select("2", from: "trip[bike_id]")
    page.select 'User', from: 'trip[subscription_type]'
    fill_in('trip[zipcode_id]', with: '96799')

    click_button("Create Trip")

    trip = Trip.last

    expect(trip.class).to eq(Trip)
    expect(trip.duration).to eq(67)
    expect(trip.start_date_id).to eq(1)
    expect(trip.end_date_id).to eq(2)

    # save_and_open_page

    expect(page).to have_content(67)
  end
end
