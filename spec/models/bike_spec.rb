RSpec.describe Bike do

  before :each do
    @city_1 = City.create(city: "San Jose")
    @city_2 = City.create(city: "Redwood")

    @start_date = BikeDate.create(date: "5/4/2014 10:16")
    @end_date = BikeDate.create(date: "5/4/2014 12:16")

    @start_station = Station.create(name: "Civic Center", dock_count: 30,
    city_id: @city_1.id, installation_date: "2017-08-30")
    @end_station = Station.create(name: "San Pedro", dock_count: 11,
    city_id: @city_2.id, installation_date: "2017-08-30")

  
    @bike_1 = Bike.create(bike: 1)
    @bike_2 = Bike.create(bike: 2)

    @subscription_type = Subscription.create(subscription_type: "Customer")

    @zip_code = ZipCode.create(zip_code: 99999)

    @trip_1 = Trip.create(duration: 100, start_date: @start_date.id, start_station: @start_station.id,
    end_station: @end_station.id, end_date: @end_date.id,
    bike_id: @bike_1.id, subscription_type: @subscription_type.id, zip_code: @zip_code.id)

    @trip_2 = Trip.create(duration: 100, start_date: @start_date.id, start_station: @start_station.id,
    end_station: @end_station.id, end_date: @end_date.id,
    bike_id: @bike_1.id, subscription_type: @subscription_type.id, zip_code: @zip_code.id)

    @trip_3 = Trip.create(duration: 100, start_date: @start_date.id, start_station: @start_station.id,
    end_station: @end_station.id, end_date: @end_date.id,
    bike_id: @bike_2.id, subscription_type: @subscription_type.id, zip_code: @zip_code.id)
  end

  describe "Validations" do
    it "is invalid without an id" do
      bike = Bike.create(bike: nil)

      expect(bike).to_not be_valid
    end
  end
end
