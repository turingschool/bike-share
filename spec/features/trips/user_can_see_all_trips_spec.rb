describe 'User visits trips' do
  it 'and can see all trips' do
    trip_one = Trip.create(duration: 174,
                           start_date: "2013-08-29 09:08:00",
                           start_station_name: "2nd at South Park",
                           end_date: "2013-08-29 09:11:00",
                           end_station_name: "10th at South Park",
                           bike_id: 288,
                           subscription_type: "Subscriber",
                           zip_code: "94114")
    trip_two = Trip.create(duration: 174,
                           start_date: "2013-08-29 09:08:00",
                           start_station_name: "2nd at South Park",
                           end_date: "2013-08-29 09:11:00",
                           end_station_name: "10th at South Park",
                           bike_id: 288,
                           subscription_type: "Subscriber",
                           zip_code: "94114")

    visit '/trips'

    expect(page).to have_content(trip_one)
    expect(page).to have_content(trip_two)
  end
end
