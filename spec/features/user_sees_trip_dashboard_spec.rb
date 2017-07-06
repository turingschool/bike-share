RSpec.describe "User visits '/trip-dashboard'" do
  before :all do
    Trip.create(duration: 50, start_station_id: 66, end_station_id: 57, bike_id: 318, zip_code: 94103, subscription_id: 1, start_date: "2013-08-29 17:01:00", end_date: "2013-08-29 17:03:00", weather_id: 1)
    Trip.create(duration: 40, start_station_id: 27, end_station_id: 27, bike_id: 48, zip_code: 97214, subscription_id: 1, start_date: "2013-08-29 10:16:00", end_date: "2013-08-29 10:17:00", weather_id: 1)
    Trip.create(duration: 30, start_station_id: 10, end_station_id: 10, bike_id: 48, zip_code: 95138, subscription_id: 1, start_date: "2013-08-29 14:42:00", end_date: "2013-08-29 14:43:00", weather_id: 1)
    Trip.create(duration: 20, start_station_id: 66, end_station_id: 57, bike_id: 48, zip_code: 94103, subscription_id: 1, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:14:00", weather_id: 1)
    Trip.create(duration: 10, start_station_id: 66, end_station_id: 57, bike_id: 318, zip_code: 32, subscription_id: 2, start_date: "2014-09-01 00:05:00", end_date: "2014-09-01 00:15:00", weather_id: 1)
    visit("/trip-dashboard")
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
    expect(page).to have_content("66")
  end

  it "and sees station with most rides as ending place" do
    expect(page).to have_content("Station with most rides as ending place")
    expect(page).to have_content("57")
  end

  it "and sees total number of rides each month" do
    expect(page).to have_content("Total number of rides each month")
    expect(page).to have_content("")
  end

  it "and sees most ridden bike" do
    expect(page).to have_content("Most ridden bike")
    expect(page).to have_content("Bike ID: 48")
  end

  it "and sees least ridden bike" do
    expect(page).to have_content("Least ridden bike")
    expect(page).to have_content("Bike ID: 318")
  end

  it "and sees date with highest trip count" do
    expect(page).to have_content("Date with highest trip count")
    expect(page).to have_content("2013-08-29")
  end

  it "and sees date with lowest trip count" do
    expect(page).to have_content("Date with lowest trip count")
    expect(page).to have_content("2014-09-01")
  end
end
