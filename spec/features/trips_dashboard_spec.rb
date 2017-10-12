require "spec_helper"

RSpec.describe "when a user visits '/trips-dashboard'" do
  it "they can see dashboard metrics" do

    Condition.create(
    date: Date.new(2013,8,28),
    max_temperature_f: 70,
    min_temperature_f: 40,
    mean_temperature_f: 60,
    mean_humidity: 30,
    mean_visibility_miles: 10,
    mean_wind_speed_mph: 4 ,
    precipitation_inches: 1,
    zip_code: 94127)

    Trip.create!(
      duration: 63,
      start_date: DateTime.new(2013,8,28,14,14),
      start_station_name: "Station 1",
      start_station_id: 1,
      end_date: DateTime.new(2013,8,29,14,14),
      end_station_name: "Station 2",
      end_station_id: 2,
      bike_id: 521,
      subscription_type: "Subscriber",
      zip_code: 94127
    )
    Trip.create!(
     duration: 161,
     start_date: DateTime.new(2013,8,28,14,14),
     start_station_name: "Station 2",
     start_station_id: 2,
     end_date: DateTime.new(2013,8,29,14,14),
     end_station_name: "Station 1",
     end_station_id: 1,
     bike_id: 521,
     subscription_type: "Customer",
     zip_code: 95234
    )
    visit "/trips-dashboard"


    expect(page).to have_content("Trip Dashboard")
    expect(page).to have_content("November")
    expect(page).to have_content("521")

  end
end
