RSpec.describe "user can view trip analytics" do
  before do
    station_one   = Station.create(name: "Turing", city: "Hell", installation_date: "1969/4/20", dock_count: 69)
    station_two   = Station.create(name: "Mushroom", city: "Englewood", installation_date: "1982/3/10", dock_count: 413)

    trip_1 = Trip.create(duration: 600, start_date: "1969/4/20", end_date: "1969/4/21",
                       start_station_id: 1, end_station_id: 2, bike_id: 4,
                       subscription_type: "Some Nonsense", zip_code: "80113")

    trip_2 = Trip.create(duration: 1200, start_date: "1969/4/20", end_date: "1969/4/21",
                       start_station_id: 1, end_station_id: 2, bike_id: 4,
                       subscription_type: "Some Nonsense", zip_code: "80113")


    trip_3 = Trip.create(duration: 180000, start_date: "1969/4/20", end_date: "1969/4/21",
                       start_station_id: 2, end_station_id: 1, bike_id: 4,
                       subscription_type: "Some Nonsense", zip_code: "80113")

    visit("/trips-dashboard")

    end


  it "sees average duration of a ride" do
    average_trip = "50:00 minutes"

    expect(page).to have_content(average_trip)
    expect(page).to have_content(Trip.average_duration_of_a_trip)
  end

  it "sees longest ride" do
    expect(page).to have_content("2 days")
    expect(page).to have_content(Trip.longest_ride)
  end

  it "sees shortest ride" do
    expect(page).to have_content("10:00")
    expect(page).to have_content(Trip.shortest_ride)
  end
end
