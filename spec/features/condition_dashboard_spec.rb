require_relative '../spec_helper'

RSpec.describe "when a user visits /conditions-dashboard" do
  it "they can see dashboard metrics" do
    condition = Condition.create(date: "4/09/2014", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)
    condition = Condition.create(date: "4/11/2014", max_temp: 76.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 1.0)
    Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)
    Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)
    Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)
    Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)
    Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)
    Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)
    visit "/conditions-dashboard"

    expect(page).to have_content("Breakdown of Trips by Max Temperature")
    expect(page).to have_content("6")
    expect(page).to have_content("Breakdown of Trips by Precipitation")
    expect(page).to have_content("2")
    expect(page).to have_content("Breakdown of Trips by Wind Speed")
    expect(page).to have_content("Breakdown of Trips by Visibility")

  end
end