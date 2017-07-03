RSpec.describe "user visits trips index" do
  it "and they see list of all the trips" do

    trip_a = Trip.new(start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
    trip_b = Trip.new(start_date_id: 5, start_station_id: 5, end_date_id: 5, end_station_id: 5, bike_id: 5, subscription_type: "customer", zipcode_id: 5)
    trip_c = Trip.new(start_date_id: 4, start_station_id: 1, end_date_id: 8, end_station_id: 4, bike_id: 4, subscription_type: "subscriber", zipcode_id: 5)

    visit("/trips")
    save_and_open_page
    expect(page).to have_content(trip_a.duration)
    expect(page).to have_content(trip_b.start_date_id)
    expect(page).to have_content(trip_c.start_station_id)
    expect(page).to have_content(trip_a.end_date_id)
    expect(page).to have_content(trip_b.end_station_id)
    expect(page).to have_content(trip_c.end_station_id)
    expect(page).to have_content(trip_a.substription_type)
    expect(page).to have_content(trip_b.zipcode)
  end
end
