require_relative "../spec_helper"
RSpec.describe Trip do
  before :each do
    city = City.create(name: "Denver")
    @station1 = city.stations.create(name: "Turing", dock_count: 100, installation_date: "3/14/2017")
    @station2 = city.stations.create(name: "Galvanize", dock_count: 1, installation_date: "4/01/1972")
    @bike = Bike.create(bike_number: 33)
    @subscription_type = SubscriptionType.create(subscription_type: "Subscription")
    @zip_code = ZipCode.create(zip_code: 80602)
    @trip1 = Trip.create(duration: 100, start_date: "8/29/2013 14:14", start_station_id: station1.id, end_date: "8/29/2013 20:14", end_station_id: station2.id, bike_id: bike.id, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
  end
  
  describe "validations" do
    it "is invalid without a duration" do
      trip = Trip.create(start_date: "8/29/2013 14:14", start_station_id: @station1.id, end_date: "8/29/2013 20:14", end_station_id: @station2.id, bike_id: @bike.id, subscription_type_id: @subscription_type.id, zip_code_id: @zip_code.id)

      expect(trip).to_not be_valid
    end
  end
    
  describe "attributes" do
    it "should have duration, start_date, start_station, end_date, end_station, bike, subscription_type and zip_code" do
      expect(trip1).to respond_to(:duration)
      expect(trip1).to respond_to(:start_date)
      expect(trip1).to respond_to(:start_station)
      expect(trip1).to respond_to(:end_date)
      expect(trip1).to respond_to(:end_station)
      expect(trip1).to respond_to(:bike)
      expect(trip1).to respond_to(:subscription_type)
      expect(trip1).to respond_to(:zip_code)
    end
  end
end