RSpec.describe "User visits '/trips-dashboard'" do
  before :all do
    start_date = DateTime.new(2001,2,3,4,5)
    end_date = DateTime.new(2001,3,3,4,5)
    installation_date = DateTime.new(2001,1,1,1,1)

    Trip.create(duration: 10, start_station_id: 1, end_station_id: 3, bike_id: 318, zip_code: 94103, subscription_type: 'Subscriber', start_date: start_date, end_date: end_date)
    Trip.create(duration: 15, start_station_id: 2, end_station_id: 2, bike_id: 318, zip_code: 97214, subscription_type: 'Subscriber', start_date: start_date, end_date: end_date)
    Trip.create(duration: 20, start_station_id: 3, end_station_id: 3, bike_id: 348, zip_code: 95138, subscription_type: 'Subscriber', start_date: start_date, end_date: end_date)
    Trip.create(duration: 25, start_station_id: 1, end_station_id: 1, bike_id: 348, zip_code: 94103, subscription_type: 'Customer', start_date: start_date, end_date: end_date)
    Trip.create(duration: 30, start_station_id: 1, end_station_id: 3, bike_id: 318, zip_code: 32453, subscription_type: 'Customer', start_date: start_date, end_date: end_date)
    Station.create(name: "Station with the thing", dock_count: 30, city_id: 2, installation_date: installation_date)
    Station.create(name: "Different station with the different thing", dock_count: 50, city_id: 2, installation_date: installation_date)
    Station.create(name: "Turbo station", dock_count: 15, city_id: 3, installation_date: installation_date)

    visit("/trips-dashboard")
    save_and_open_page
  end

  it "and sees average duration" do
    expect(page).to have_content("Average duration of a ride: 20 minutes")
  end

  it "and sees the longest ride" do
    expect(page).to have_content("Longest ride: 30 minutes")
  end

  it "and sees the shorest ride" do
    expect(page).to have_content("Shortest ride: 10 minutes")
  end

  it "station with the most starting rides" do
    expect(page).to have_content("Station with the most rides as a starting place: Station with the thing")
  end

  it "station with the most ending places" do
    expect(page).to have_content("Station with the most rides as a starting place: Station with the thing")
  end

  it "most ridden bike and total number of rides for it" do
    expect(page).to have_content("Most ridden bike with total number of rides for that bike: Bike: 318 Rides: 3")
  end

  it "text" do

  end
end
