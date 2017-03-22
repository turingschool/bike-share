require_relative "../spec_helper"
RSpec.describe ZipCode do
  before :each do
    @zip_code1 = ZipCode.create(zip_code: 80602)
  end

  describe "validations" do
    it "is invalid without a zip_code number" do
      zip_code = ZipCode.create

      expect(zip_code).to_not be_valid
    end

    it "is valid with zip_code number" do
      expect(@zip_code1).to be_valid
    end
  end

  describe "attributes" do
    it "should have zip_code number" do
      expect(@zip_code1).to respond_to(:zip_code)
    end
  end

  describe "trip relationships" do
    before :each do
      city = City.create(name: "Denver")
      station1 = city.stations.create(name: "Turing", dock_count: 100, installation_date: "14/3/2017")
      station2 = city.stations.create(name: "Galvanize", dock_count: 1, installation_date: "1/4/1972")
      bike1 = Bike.create(bike_number: 33)
      subscription_type1 = SubscriptionType.create(subscription_type: "Subscriber")
      zip_code2 = ZipCode.create(zip_code: 80602)
      @trip1 = Trip.create(start_date: "30/8/2013 14:14", start_station_id: station1.id, end_date: "29/8/2013 20:14", end_station_id: station2.id, bike_id: bike1.id, subscription_type_id: subscription_type1.id, zip_code_id: @zip_code1.id)
      @trip2 = Trip.create(start_date: "29/8/2013 14:14", start_station_id: station1.id, end_date: "29/8/2013 20:14", end_station_id: station2.id, bike_id: bike1.id, subscription_type_id: subscription_type1.id, zip_code_id: @zip_code1.id)
      @trip3 = Trip.create(start_date: "29/10/2014 14:14", start_station_id: station2.id, end_date: "29/8/2013 20:14", end_station_id: station1.id, bike_id: bike1.id, subscription_type_id: subscription_type1.id, zip_code_id: @zip_code1.id)
      @trip4 = Trip.create(start_date: "29/10/2014 14:14", start_station_id: station2.id, end_date: "29/8/2013 20:14", end_station_id: station1.id, bike_id: bike1.id, subscription_type_id: subscription_type1.id, zip_code_id: @zip_code1.id)
    end

    it "should return trips" do
      expect(@zip_code1.trips.count).to eq(4)
      expect(@zip_code1.trips.find(1).start_date).to eq("30/8/2013 14:14")
    end
  end

end
