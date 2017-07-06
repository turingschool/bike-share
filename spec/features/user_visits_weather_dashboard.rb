RSpec.describe "User visits '/weather-dashboard'" do
  before :all do
    seed_city_database("db/fixtures/stations.csv")
    seed_weather_database("db/fixtures/weather.csv")
    seed_station_database("db/fixtures/stations.csv")
    seed_subscriptions_database("db/fixtures/trips.csv")
    seed_trips_database("db/fixtures/trips.csv")
    visit("/weather-dashboard")
  end
  it "and sees average rides per day based on max_temperature" do
    expect(page).to have_content("70 to 80 degrees: 2")
  end
  it "and sees highest rides per day based on max_temperature" do
    expect(page).to have_content("70 to 80 degrees: 3")
  end
  it "and sees highest rides per day based on max_temperature" do
    expect(page).to have_content("70 to 80 degrees: 1")
  end
  it "and sees average rides per day based on precipitation" do
    expect(page).to have_content("5.5 to 6.0 inches: 2")
  end
  it "and sees highest rides per day based on precipitation" do
    expect(page).to have_content("5.5 to 6.0 inches: 3")
  end
  it "and sees highest rides per day based on precipitation" do
    expect(page).to have_content("5.5 to 6.0 inches: 1")
  end
end
