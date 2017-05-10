require_relative '../spec_helper'

RSpec.describe "When a user visits '/conditions-dashboard'" do
  it "they see dashboard data labels" do
    date = DateRef.create!(date: "2010-01-01")
    date1 = DateRef.create!(date: "2016-01-01")
    date2 = DateRef.create!(date: "2017-01-01")
    date3 = DateRef.create!(date: "2010-03-01")
    date4 = DateRef.create!(date: "2010-04-01")
    city = City.create!(name: "Denver")
    station1= Station.create!(name: "Broadway", dock_count: 10, city_id: city.id, date_ref_id: date.id)
    station2= Station.create!(name: "Market", dock_count: 100, city_id: city.id, date_ref_id: date1.id)
    station3= Station.create!(name: "Turing", dock_count: 1, city_id: city.id, date_ref_id: date1.id)
    station4= Station.create!(name: "Lawrence", dock_count: 11, city_id: city.id, date_ref_id: date2.id)
    station5= Station.create!(name: "Sterling", dock_count: 10, city_id: city.id, date_ref_id: date.id)
    station6= Station.create!(name: "Evergreen", dock_count: 100, city_id: city.id, date_ref_id: date1.id)
    station7= Station.create!(name: "Englewood", dock_count: 1, city_id: city.id, date_ref_id: date1.id)
    bike = Bike.create!(bike: 100)
    zipcode = Zipcode.create!(zipcode: 10010)
    subscription = SubscriptionType.create!(sub_type: "Weekly")
    Trip.create!(duration: 5000, date_ref_id: date3.id, end_date_id: date3.id, start_station_id: station1.id, end_station_id: station1.id, zipcode_id: zipcode.id, bike_id: bike.id, subscription_type_id: subscription.id)
    Trip.create!(duration: 5000, date_ref_id: date3.id, end_date_id: date3.id, start_station_id: station1.id, end_station_id: station1.id, zipcode_id: zipcode.id, bike_id: bike.id, subscription_type_id: subscription.id)
    Trip.create!(duration: 5000, date_ref_id: date4.id, end_date_id: date4.id, start_station_id: station1.id, end_station_id: station1.id, zipcode_id: zipcode.id, bike_id: bike.id, subscription_type_id: subscription.id)
    WeatherStatistic.create!(max_temperature: 1, mean_temperature: 1, min_temperature: 1, mean_humidity: 1, mean_visibility: 1, mean_wind_speed:1, precipitation:1, date_ref_id: date1.id)
    WeatherStatistic.create!(max_temperature: 89, mean_temperature: 40, min_temperature: 20, mean_humidity: 40, mean_visibility: 50, mean_wind_speed: 22, precipitation: 8, date_ref_id: date.id)
    WeatherStatistic.create!(max_temperature: 56, mean_temperature: 34, min_temperature: 13, mean_humidity: 14, mean_visibility: 23, mean_wind_speed:17, precipitation:7, date_ref_id: date2.id)
    WeatherStatistic.create!(max_temperature: 34, mean_temperature: 23, min_temperature: 19, mean_humidity: 56, mean_visibility: 42, mean_wind_speed:16, precipitation:5, date_ref_id: date2.id)
    WeatherStatistic.create!(max_temperature: 87, mean_temperature: 23, min_temperature: 11, mean_humidity: 34, mean_visibility: 56, mean_wind_speed:14, precipitation:2, date_ref_id: date3.id)
    WeatherStatistic.create!(max_temperature: 10, mean_temperature: 15, min_temperature: 12, mean_humidity: 78, mean_visibility: 76, mean_wind_speed:13, precipitation:3, date_ref_id: date4.id)
    WeatherStatistic.create!(max_temperature: 48, mean_temperature: 9, min_temperature: 0, mean_humidity: 58, mean_visibility: 54, mean_wind_speed:11, precipitation:13, date_ref_id: date4.id)

    visit('/conditions-dashboard')
    expect(page).to have_content("Ride Stats Based on Temperature")
    expect(page).to have_content("Temperature Range (in degree F)")
    expect(page).to have_content("Maximum Rides")
    expect(page).to have_content("Average Rides")
    expect(page).to have_content("Minimum Rides")
    expect(page).to have_content("Ride Stats Based on Precipitation")
    expect(page).to have_content("Precipitation Range (in inches)")
    expect(page).to have_content("Ride Stats Based on Wind Speed")
    expect(page).to have_content("Wind Speed Range (in mph)")
    expect(page).to have_content("Ride Stats Based on Visibility")
    expect(page).to have_content("Visibility Range (in miles)")
  end
end
