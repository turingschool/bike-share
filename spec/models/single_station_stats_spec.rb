require_relative "../spec_helper"

RSpec.describe Station do
  before :each do
    city = City.create(name: "Denver")
    @station1 = city.stations.create(name: "Turing", dock_count: 100, installation_date: "14/3/2017")
    @station2 = city.stations.create(name: "Galvanize", dock_count: 1, installation_date: "1/4/1972")
    @station3 = city.stations.create(name: "16th St", dock_count: 50, installation_date: "2/4/1983")
    @bike1 = Bike.create(bike_number: 33)
    @bike2 = Bike.create(bike_number: 44)
    subscription_type1 = SubscriptionType.create(subscription_type: "Subscriber")
    subscription_type2 = SubscriptionType.create(subscription_type: "Customer")
    zip_code1 = ZipCode.create(zip_code: 80602)
    zip_code2 = ZipCode.create(zip_code: 80603)
    @trip1 = Trip.create(start_date: "30/8/2013 14:14", start_station_id: @station1.id, end_date: "29/8/2013 20:14", end_station_id: @station2.id, bike_id: @bike1.id, subscription_type_id: subscription_type1.id, zip_code_id: zip_code1.id)
    @trip2 = Trip.create(start_date: "29/8/2013 14:14", start_station_id: @station1.id, end_date: "29/8/2013 20:14", end_station_id: @station3.id, bike_id: @bike2.id, subscription_type_id: subscription_type2.id, zip_code_id: zip_code1.id)
    @trip3 = Trip.create(start_date: "29/10/2014 14:14", start_station_id: @station2.id, end_date: "29/8/2013 20:14", end_station_id: @station1.id, bike_id: @bike2.id, subscription_type_id: subscription_type2.id, zip_code_id: zip_code1.id)
    @trip4 = Trip.create(start_date: "29/10/2014 14:14", start_station_id: @station3.id, end_date: "29/8/2013 20:14", end_station_id: @station2.id, bike_id: @bike2.id, subscription_type_id: subscription_type2.id, zip_code_id: zip_code1.id)
    @trip5 = Trip.create(start_date: "29/8/2013 14:14", start_station_id: @station1.id, end_date: "29/8/2013 20:14", end_station_id: @station2.id, bike_id: @bike2.id, subscription_type_id: subscription_type2.id, zip_code_id: zip_code2.id)

  end

  describe "#number_of_rides_started" do
    it "returns numbers of rides started at this station" do
      expect( @station1.number_of_rides_started ).to eq(3)
    end
  end

  describe "#number_of_rides_ended" do
    it "returns numbers of rides started at this station" do
      expect( @station1.number_of_rides_ended ).to eq(1)
    end
  end

  describe "#most_frequent_destination" do
    it "returns the station with the most frequent destination" do
      expect( @station1.most_frequent_destination ).to eq("Galvanize")
    end
  end

  describe "#most_frequent_origin" do
    it "returns the station with the most frequent origin" do
      expect( @station2.most_frequent_origin ).to eq("Turing")
    end
  end

  describe "#busiest_days" do
    it "returns the date that this station has the most start trips" do
      expect( @station1.busiest_days ).to eq("August 29, 2013 with 2 trips")
    end
  end

  describe "#most_frequent_zip_codes" do
    it "returns the most frequent zip code for users starting trips at this station" do
      expect( @station1.most_frequent_zip_codes ).to eq("80602 with 2 trips")
    end
  end

  describe "#most_frequent_bike" do
    it "returns the Bike Number most frequently starting a trip at this station" do
      expect( @station1.most_frequent_bike ).to eq("44 with 2 trips")
    end
  end
end
