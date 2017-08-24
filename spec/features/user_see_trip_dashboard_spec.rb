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

  it "least ridden bike and total number of rides for it" do
    expect(page).to have_content("Least ridden bike with total number of rides for that bike: Bike: 348 Rides: 2")
  end

  it "user subscription type with count and percentage" do
    expect(page).to have_content("User subscription type breakout with both count and percentage: Subscribers total: 3 Percentage: 60.0")
  end

  it "date with highest number of trips and its count" do
    expect(page).to have_content("Single date with the highest number of trips with a count of those trips: Date: 2001-02-03, Count: 5")
  end

  it "date with lowest number of trips and its count" do
    expect(page).to have_content("Single date with the lowest number of trips with a count of those trips: Date: 2001-02-03, Count: 5")
  end

  it "has a breakdown of rides by month and year" do
    expect(page).to have_content("January")
    expect(page).to have_content("February")
    expect(page).to have_content("March")
    expect(page).to have_content("April")
    expect(page).to have_content("May")
    expect(page).to have_content("June")
    expect(page).to have_content("July")
    expect(page).to have_content("August")
    expect(page).to have_content("September")
    expect(page).to have_content("October")
    expect(page).to have_content("November")
    expect(page).to have_content("December")
    expect(page).to have_content("2013")
    expect(page).to have_content("2014")
    expect(page).to have_content("2015")
    expect(page).to have_content("2016")
  end
end
