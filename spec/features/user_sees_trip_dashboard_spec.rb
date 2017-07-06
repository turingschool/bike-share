RSpec.describe "User visits '/trips-dashboard'" do
  before :all do
    Trip.create(duration: 50, start_station_id: 1, end_station_id: 3, bike_id: 318, zip_code: 94103, subscription_id: 1, start_date: "2013-08-29 17:01:00", end_date: "2013-08-29 17:03:00", weather_id: 1)
    Trip.create(duration: 40, start_station_id: 2, end_station_id: 2, bike_id: 48, zip_code: 97214, subscription_id: 1, start_date: "2013-08-29 10:16:00", end_date: "2013-08-29 10:17:00", weather_id: 1)
    Trip.create(duration: 30, start_station_id: 3, end_station_id: 3, bike_id: 48, zip_code: 95138, subscription_id: 1, start_date: "2013-08-29 14:42:00", end_date: "2013-08-29 14:43:00", weather_id: 1)
    Trip.create(duration: 20, start_station_id: 1, end_station_id: 1, bike_id: 48, zip_code: 94103, subscription_id: 1, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:14:00", weather_id: 1)
    Trip.create(duration: 10, start_station_id: 1, end_station_id: 3, bike_id: 318, zip_code: 32, subscription_id: 2, start_date: "2014-09-01 00:05:00", end_date: "2014-09-01 00:15:00", weather_id: 1)

    Station.create(name: "Mission", dock_count: 30, city_id: 2, installation_date: "1/4/15")
    Station.create(name: "Embarcadero", dock_count: 50, city_id: 2, installation_date: "3/4/16")
    Station.create(name: "Rockridge", dock_count: 15, city_id: 3, installation_date: "5/4/17")

    Subscription.create(subscription_type: "Subscriber")
    Subscription.create(subscription_type: "Customer")
    visit("/trips-dashboard")
    save_and_open_page
  end

  it "and sees average duration" do
    expect(page).to have_content("Average duration of a ride")
    expect(page).to have_content("30")
  end

  it "and sees longest ride" do
    expect(page).to have_content("Longest ride")
    expect(page).to have_content("50")
  end

  it "and sees shortest ride" do
    expect(page).to have_content("Shortest ride")
    expect(page).to have_content("10")
  end

  it "and sees station with most rides as starting place" do
    expect(page).to have_content("Station with most rides as ending place")
    expect(page).to have_content("1")
  end

  it "and sees station with most rides as ending place" do
    expect(page).to have_content("Station with most rides as ending place")
    expect(page).to have_content("3")
  end

  it "and sees total number of rides each month" do
    expect(page).to have_content("Total number of rides each month")
    expect(page).to have_content("8/2013")
    expect(page).to have_content("4")
    expect(page).to have_content("9/2014")
    expect(page).to have_content("1")
  end

  it "and sees date with highest trip count" do
    expect(page).to have_content("Date with highest trip count")
    expect(page).to have_content("8/29/2013: 4")
  end

  it "and sees date with lowest trip count" do
    expect(page).to have_content("Date with lowest trip count")
    expect(page).to have_content("9/1/2014: 1")
  end
end
