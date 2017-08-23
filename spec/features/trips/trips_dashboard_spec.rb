require './app/models/trip'
require 'pry'


RSpec.describe "User visits '/trips-dashboard'" do
  it "average duration of trip" do
    start_station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
    end_station   = Station.create(name: "Station_2", dock_count: 30, city: "cityville", installation_date: "3/5/15")
    subscription  = SubscriptionType.create(subscription_type: "Customer")

    Trip.create(duration: 1200, start_date: "2017-08-20 19:20:22", start_station_id: start_station.id, end_date: "2017-08-20 19:20:22", end_station_id: end_station.id, bike_id: 4, subscription_type: subscription, zip_code: 99000)
    Trip.create(duration: 600, start_date: "2017-08-05 19:20:22", start_station_id: start_station.id, end_date: "2017-08-05 19:20:22", end_station_id: end_station.id, bike_id: 520, subscription_type: subscription, zip_code: 12345)

    visit '/trips-dashboard'

    expect(page).to have_content("15")
  end

  it "shows longest ride" do
    start_station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
    end_station   = Station.create(name: "Station_2", dock_count: 30, city: "cityville", installation_date: "3/5/15")
    subscription  = SubscriptionType.create(subscription_type: "Customer")

    Trip.create(duration: 600, start_date: "2017-08-20 19:20:22", start_station_id: start_station.id, end_date: "2017-08-20 19:20:22", end_station_id: end_station.id, bike_id: 4, subscription_type: subscription, zip_code: 99000)
    Trip.create(duration: 500, start_date: "2017-08-05 19:20:22", start_station_id: start_station.id, end_date: "2017-08-05 19:20:22", end_station_id: end_station.id, bike_id: 520, subscription_type_id: subscription, zip_code: 12345)

    visit '/trips-dashboard'

    expect(page).to have_content("10")
  end

  it "shows shortest ride" do
    start_station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
    end_station   = Station.create(name: "Station_2", dock_count: 30, city: "cityville", installation_date: "3/5/15")
    subscription  = SubscriptionType.create(subscription_type: "Customer")

    Trip.create(duration: 900, start_date: "2017-08-20 19:20:22", start_station_id: start_station.id, end_date: "2017-08-20 19:20:22", end_station_id: end_station.id, bike_id: 4, subscription_type: subscription, zip_code: 99000)
    Trip.create(duration: 600, start_date: "2017-08-05 19:20:22", start_station_id: start_station.id, end_date: "2017-08-05 19:20:22", end_station_id: end_station.id, bike_id: 520, subscription_type: subscription, zip_code: 12345)

    visit '/trips-dashboard'

    expect(page).to have_content("10")
  end

  it "shows the station with the most rides originating from it" do
    start_station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
    end_station   = Station.create(name: "Station_2", dock_count: 30, city: "cityville", installation_date: "3/5/15")
    subscription  = SubscriptionType.create(subscription_type: "Customer")

    Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: start_station.id, end_date: "2017-08-20 19:20:22", end_station_id: end_station.id, bike_id: 4, subscription_type: subscription, zip_code: 99000)
    Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: start_station.id, end_date: "2017-08-20 19:20:22", end_station_id: end_station.id, bike_id: 4, subscription_type: subscription, zip_code: 99000)
    Trip.create(duration: 40, start_date: "2017-08-05 19:20:22", start_station_id: start_station.id, end_date: "2017-08-05 19:20:22", end_station_id: end_station.id, bike_id: 520, subscription_type: subscription, zip_code: 12345)

    visit '/trips-dashboard'

    expect(page).to have_content("The station with the most rides as a starting point is Station_1")
  end

  it "shows the station with the most rides ending at it" do
    start_station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
    end_station   = Station.create(name: "Station_2", dock_count: 30, city: "cityville", installation_date: "3/5/15")
    subscription  = SubscriptionType.create(subscription_type: "Customer")

    Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: start_station.id, end_date: "2017-08-20 19:20:22", end_station_id: end_station.id, bike_id: 4, subscription_type: subscription, zip_code: 99000)
    Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: start_station.id, end_date: "2017-08-20 19:20:22", end_station_id: end_station.id, bike_id: 4, subscription_type: subscription, zip_code: 99000)
    Trip.create(duration: 40, start_date: "2017-08-05 19:20:22", start_station_id: start_station.id, end_date: "2017-08-05 19:20:22", end_station_id: end_station.id, bike_id: 520, subscription_type: subscription, zip_code: 12345)

    visit '/trips-dashboard'

    expect(page).to have_content("The station with the most rides as an end point is Station_2")
  end


end
