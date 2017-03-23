require_relative'../spec_helper'

RSpec.describe Station do
  attr_reader :station1, :station2, :station3

  before :each do
    City.create(name:"Chicago")
    City.create(name:"Denver")
    City.create(name:"Santa Fey")
    SubscriptionType.create(flavor: "Subscriber")
    SubscriptionType.create(flavor: "Customer")
    Station.create(name: "Navy Pier", dock_count: "10", installation_date: "20160401", city_id: 1)
    Station.create(name: "Whatever", dock_count: "6", installation_date: "20160603", city_id: 2)
    Station.create(name: "New", dock_count: "10", installation_date: "20160303", city_id: 2)
    Trip.create(duration: 39, start_date: format_date("12/12/2013 14:54"), start_station_id: 2, end_date: format_date("12/12/2013 15:56"), bike_id: 6, end_station_id: 2, subscription_type_id: 1 )
    Trip.create(duration: 39, start_date: format_date("12/15/2013 14:54"), start_station_id: 2, end_date: format_date("12/15/2013 15:56"), bike_id: 1, end_station_id: 2, subscription_type_id: 1 )
    Trip.create(duration: 39, start_date: format_date("12/15/2013 14:54"), start_station_id: 2, end_date: format_date("12/15/2013 15:56"), bike_id: 7, end_station_id: 2, subscription_type_id: 1 )
  end

  describe "validations" do
    it "can give date with highest trips at current station" do
      expect(Station.date_with_highest_number_of_trips.first).to eq(("2013-12-15").to_date)
    end
  end
end
