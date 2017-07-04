RSpec.describe "user edits trip" do
  it "with valid attributes" do

    trip = Trip.create(duration: 53, start_date_id: 2, end_date_id: 2, start_station_id: 3, end_station_id: 3, bike_id: 3, subscription_type: 'Subscriber', zipcode_id: 3)
    trip_2 = Trip.create(duration: 174, start_date_id: 1, end_date_id: 3, start_station_id: 2, end_station_id: 2, bike_id: 1, subscription_type: 'Customer', zipcode_id: 2)
    trip_3 = Trip.create(duration: 13, start_date_id: 3, end_date_id: 1, start_station_id: 1, end_station_id: 1, bike_id: 2, subscription_type: 'Customer', zipcode_id: 4)

    date = BikeShareDate.create(date: Date.strptime('1/1/2012', '%m/%d/%Y'))
    date_2 = BikeShareDate.create(date: Date.strptime('2/5/2017', '%m/%d/%Y'))
    date_3 = BikeShareDate.create(date: Date.strptime('4/12/2014', '%m/%d/%Y'))

    station_a = Station.create(name: "A", dock_count: 2, installation_date_id: 2, city: "Lakewood")
    station_b = Station.create(name: "B", dock_count: 2, installation_date_id: 1, city: "Denver")
    station_c = Station.create(name: "C", dock_count: 5, installation_date_id: 3, city: "Littleton")


    visit("/trips/2/edit")
    save_and_open_page
    fill_in("trip[bike_id]", with: Integer)
    fill_in("trip[duration]", with: Integer)
    #fill_in("trip[start_date_id]", with: "1990-04-16")
    fill_in("trip[end_date_id]", with: "new_city")
    fill_in("trip[subscription_type]", with: "new_city")
    fill_in("trip[bike_id]", with: "new_city")
    fill_in("trip[start_station_id]", with: "new_city")


    click_button("Edit Trip")
    trip = Trip.last
    expect(current_path).to eq("/trips/#{trip.id}")
    expect(page).to have_content("new_city")
  end
end
