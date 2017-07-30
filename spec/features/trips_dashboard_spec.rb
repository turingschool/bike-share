require_relative '../spec_helper'

RSpec.describe "when a user visits /trips-dashboard" do
  it "they can see dashboard metrics" do
    City.create(name:"San Jose")
    City.create(name:"Mountain View")
    Station.create(name: "Union Station", dock_count: 12, installation_date: "15/5/2016", city_id: 1)
    Station.create(name: "Penn Station", dock_count: 10, installation_date: "17/5/2016", city_id: 2)
    Station.create(name: "Grand Central Station", dock_count: 12, installation_date: "19/5/2016", city_id: 1)
    Bike.create(bike_number: 23)
    Bike.create(bike_number: 25)
    ZipCode.create(zip_code: 80210)
    SubscriptionType.create(subscription_type: "Subscriber")
    SubscriptionType.create(subscription_type: "Customer")
    Trip.create(duration: 60, start_date: "23/9/2014", start_station_id: 1, end_date: "23/9/2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, zip_code_id: 1)
    Trip.create(duration: 40, start_date: "23/9/2014", start_station_id: 1, end_date: "23/9/2014", end_station_id: 2, bike_id: 2, subscription_type_id: 1, zip_code_id: 1)
    Trip.create(duration: 110, start_date: "23/8/2015", start_station_id: 3, end_date: "23/8/2015", end_station_id: 2, bike_id: 1, subscription_type_id: 2, zip_code_id: 1)
    condition = Condition.create(date: "23/09/2014", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)
    condition = Condition.create(date: "23/08/2015", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)

    visit "/trips-dashboard"

    expect(page).to have_content("Average Ride Duration: 70.0 minutes")
    expect(page).to have_content("Longest Ride: 110 minutes")
    expect(page).to have_content("Shortest Ride: 40 minutes")
    expect(page).to have_content("Most Frequent Starting Station: Union Station")
    expect(page).to have_content("Most Frequent Ending Station: Penn Station")
    expect(page).to have_content("Month by Month Breakdown")
    expect(page).to have_content("Most Popular Bike: Bike 23 Trips: 2")
    expect(page).to have_content("Least Popular Bike: Bike 25 Trips: 1")
    expect(page).to have_content("Customer: 33.33% (1)")
    expect(page).to have_content("Busiest Day: 2014-09-23 - 2 trip(s)")
    expect(page).to have_content("Least Busy Day: 2015-08-23 - 1 trip(s)")
  end
end