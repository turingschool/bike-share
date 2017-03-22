require_relative '../spec_helper'

RSpec.describe Station do
  describe "attributes" do
    it "should have a name, dock_count, city_id, installation_date" do
      station = Station.new(name: "union station", dock_count: 12, city_id: 1, installation_date: 2/14/2014)

      expect(station).to respond_to(:name, :dock_count, :city_id, :installation_date)
    end
  end

  describe "validations" do
    it "is invalid without a name" do
      station = Station.new(dock_count: 12, city_id: 1, installation_date: 2/14/2014)

      expect(station).to_not be_valid
    end

    it "is invalid without a dock_count" do
      station = Station.new(name: "Union Station", city_id: 1, installation_date: 2/14/2014)

      expect(station).to_not be_valid
    end

    it "is invalid without a city_id" do
      station = Station.new(name: "Union Station", dock_count: 12, installation_date: 2/14/2014)

      expect(station).to_not be_valid
    end

    it "is invalid without a installation_date" do
      station = Station.new(name: "Union Station", dock_count: 12, city_id: 1)

      expect(station).to_not be_valid
    end
  end

  describe ".count" do
    it "returns total number of stations" do
      City.create(name: "San Jose")
      Station.create(name: "Union Station", dock_count: 12, installation_date: "Wed, 09 Apr 2014", city_id: 1)
      Station.create(name: "Penn Station", dock_count: 15, installation_date: "Wed, 09 Apr 2014", city_id: 1)

      expect(Station.count).to eq(2)
    end
  end

  describe ".average_bikes_per_station" do
    it "returns average number of available bikes per station" do
      City.create(name: "San Jose")
      Station.create(name: "Union Station", dock_count: 10, installation_date: "Wed, 09 Apr 2014", city_id: 1)
      Station.create(name: "Penn Station", dock_count: 20, installation_date: "Wed, 09 Apr 2014", city_id: 1)

      expect(Station.average_bikes_per_station).to eq(15)
    end
  end

  describe ".max_bikes_available" do
    it "returns greatest number of available bikes at a station" do
      City.create(name: "San Jose")
      Station.create(name: "Union Station", dock_count: 10, installation_date: "Wed, 09 Apr 2014", city_id: 1)
      Station.create(name: "Penn Station", dock_count: 20, installation_date: "Wed, 09 Apr 2014", city_id: 1)

      expect(Station.max_bikes_available).to eq(20)
    end
  end

  describe ".station_with_most_bikes" do
    it "returns station(s) with most bikes available" do
      City.create(name: "San Jose")
      Station.create(name: "Union Station", dock_count: 10, installation_date: "Wed, 09 Apr 2014", city_id: 1)
      station_1 = Station.create(name: "Penn Station", dock_count: 20, installation_date: "Wed, 09 Apr 2014", city_id: 1)
      station_2 = Station.create(name: "Grand Central Station", dock_count: 20, installation_date: "Wed, 09 Apr 2014", city_id: 1)

      expect(Station.station_with_most_bikes).to eq("Penn Station, Grand Central Station")
    end
  end

  describe ".fewest_bikes_available" do
    it "returns fewest number of available bikes at a station" do
      City.create(name: "San Jose")
      Station.create(name: "Union Station", dock_count: 10, installation_date: "Wed, 09 Apr 2014", city_id: 1)
      Station.create(name: "Penn Station", dock_count: 20, installation_date: "Wed, 09 Apr 2014", city_id: 1)

      expect(Station.fewest_bikes_available).to eq(10)
    end
  end

  describe ".station_with_fewest_bikes" do
    it "returns station(s) with fewest bikes available" do
      City.create(name: "San Jose")
      station_1 = Station.create(name: "Union Station", dock_count: 10, installation_date: "Wed, 09 Apr 2014", city_id: 1)
      station_2 = Station.create(name: "Penn Station", dock_count: 10, installation_date: "Wed, 09 Apr 2014", city_id: 1)
      Station.create(name: "Grand Central Station", dock_count: 20, installation_date: "Wed, 09 Apr 2014", city_id: 1)

      expect(Station.station_with_fewest_bikes).to eq("Union Station, Penn Station")
    end
  end

  describe ".newest_station" do
    it "returns most recently installed station" do
      City.create(name: "San Jose")
      station_1 = Station.create(name: "Union Station", dock_count: 10, installation_date: "Wed, 09 Apr 2014", city_id: 1)
      station_2 = Station.create(name: "Penn Station", dock_count: 10, installation_date: "Fri, 11 Apr 2014", city_id: 1)
      station_3 = Station.create(name: "Grand Central Station", dock_count: 20, installation_date: "Tue, 15 Apr 2014", city_id: 1)

      expect(Station.newest_station).to eq("Grand Central Station")
    end
  end

  describe ".oldest_station" do
    it "returns oldest station" do
      City.create(name: "San Jose")
      station_1 = Station.create(name: "Union Station", dock_count: 10, installation_date: "Wed, 09 Apr 2014", city_id: 1)
      station_2 = Station.create(name: "Penn Station", dock_count: 10, installation_date: "Fri, 11 Apr 2014", city_id: 1)
      station_3 = Station.create(name: "Grand Central Station", dock_count: 20, installation_date: "Tue, 15 Apr 2014", city_id: 1)

      expect(Station.oldest_station).to eq("Union Station")
    end
  end

    describe "#frequent_destination" do
    it "most frequent destination station from a particular station" do
      City.create(name: "San Jose")
      station_1 = Station.create(name: "Union Station", dock_count: 10, installation_date: "Wed, 09 Apr 2014", city_id: 1)
      station_2 = Station.create(name: "Penn Station", dock_count: 10, installation_date: "Fri, 11 Apr 2014", city_id: 1)
      station_3 = Station.create(name: "Grand Central Station", dock_count: 20, installation_date: "Tue, 15 Apr 2014", city_id: 1)
      Bike.create(bike_number: 23)
      Bike.create(bike_number: 25)
      ZipCode.create(zip_code: 80210)
      Trip.create(duration: 60, start_date: "24/9/2014", start_station_id: 1, end_date: "23/9/2014", end_station_id: 2, bike_id: 1, subscription_type_id: 1, zip_code_id: 1)
      Trip.create(duration: 40, start_date: "23/9/2014", start_station_id: 1, end_date: "23/9/2014", end_station_id: 1, bike_id: 2, subscription_type_id: 1, zip_code_id: 1)
      Trip.create(duration: 40, start_date: "23/9/2014", start_station_id: 2, end_date: "23/9/2014", end_station_id: 2, bike_id: 2, subscription_type_id: 1, zip_code_id: 1)
      expect(station_1.frequent_destination).to eq("Penn Station")
    end
  end

  describe "#frequent_origination" do
    it "most frequent origination station from a particular station" do
      City.create(name: "San Jose")
      station_1 = Station.create(name: "Union Station", dock_count: 10, installation_date: "Wed, 09 Apr 2014", city_id: 1)
      station_2 = Station.create(name: "Penn Station", dock_count: 10, installation_date: "Fri, 11 Apr 2014", city_id: 1)
      station_3 = Station.create(name: "Grand Central Station", dock_count: 20, installation_date: "Tue, 15 Apr 2014", city_id: 1)
      Bike.create(bike_number: 23)
      Bike.create(bike_number: 25)
      ZipCode.create(zip_code: 80210)
      Trip.create(duration: 60, start_date: "24/9/2014", start_station_id: 1, end_date: "23/9/2014", end_station_id: 2, bike_id: 1, subscription_type_id: 1, zip_code_id: 1)
      Trip.create(duration: 40, start_date: "23/9/2014", start_station_id: 1, end_date: "23/9/2014", end_station_id: 2, bike_id: 2, subscription_type_id: 1, zip_code_id: 1)
      Trip.create(duration: 40, start_date: "23/9/2014", start_station_id: 2, end_date: "23/9/2014", end_station_id: 2, bike_id: 2, subscription_type_id: 1, zip_code_id: 1)
      expect(station_2.frequent_origination).to eq("Union Station")
    end
  end

  describe "#busiest_day" do
    it "returns day with most trips" do
      City.create(name: "San Jose")
      station_1 = Station.create(name: "Union Station", dock_count: 10, installation_date: "Wed, 09 Apr 2014", city_id: 1)
      station_2 = Station.create(name: "Penn Station", dock_count: 10, installation_date: "Fri, 11 Apr 2014", city_id: 1)
      station_3 = Station.create(name: "Grand Central Station", dock_count: 20, installation_date: "Tue, 15 Apr 2014", city_id: 1)
      Bike.create(bike_number: 23)
      Bike.create(bike_number: 25)
      ZipCode.create(zip_code: 80210)
      Trip.create(duration: 60, start_date: "24/9/2014", start_station_id: 1, end_date: "23/9/2014", end_station_id: 2, bike_id: 1, subscription_type_id: 1, zip_code_id: 1)
      Trip.create(duration: 40, start_date: "24/9/2014", start_station_id: 1, end_date: "23/9/2014", end_station_id: 1, bike_id: 2, subscription_type_id: 1, zip_code_id: 1)
      Trip.create(duration: 40, start_date: "23/9/2014", start_station_id: 2, end_date: "23/9/2014", end_station_id: 2, bike_id: 2, subscription_type_id: 1, zip_code_id: 1)
      expect(station_1.busiest_day.to_s).to eq("2014-09-24")
    end
  end

  describe "#max_zip_code_count" do
    it "returns most frequent zip code" do
      City.create(name: "San Jose")
      station_1 = Station.create(name: "Union Station", dock_count: 10, installation_date: "Wed, 09 Apr 2014", city_id: 1)
      station_2 = Station.create(name: "Penn Station", dock_count: 10, installation_date: "Fri, 11 Apr 2014", city_id: 1)
      station_3 = Station.create(name: "Grand Central Station", dock_count: 20, installation_date: "Tue, 15 Apr 2014", city_id: 1)
      Bike.create(bike_number: 23)
      Bike.create(bike_number: 25)
      ZipCode.create(zip_code: 80210)
      Trip.create(duration: 60, start_date: "24/9/2014", start_station_id: 1, end_date: "23/9/2014", end_station_id: 2, bike_id: 1, subscription_type_id: 1, zip_code_id: 1)
      Trip.create(duration: 40, start_date: "24/9/2014", start_station_id: 1, end_date: "23/9/2014", end_station_id: 1, bike_id: 2, subscription_type_id: 1, zip_code_id: 1)
      Trip.create(duration: 40, start_date: "23/9/2014", start_station_id: 2, end_date: "23/9/2014", end_station_id: 2, bike_id: 2, subscription_type_id: 1, zip_code_id: 1)
      expect(station_1.max_zip_code_count.to_s).to eq("80210")
    end
  end

  describe "#most_frequent_bike" do
    it "returns most used bike" do
      City.create(name: "San Jose")
      station_1 = Station.create(name: "Union Station", dock_count: 10, installation_date: "Wed, 09 Apr 2014", city_id: 1)
      station_2 = Station.create(name: "Penn Station", dock_count: 10, installation_date: "Fri, 11 Apr 2014", city_id: 1)
      station_3 = Station.create(name: "Grand Central Station", dock_count: 20, installation_date: "Tue, 15 Apr 2014", city_id: 1)
      Bike.create(bike_number: 23)
      Bike.create(bike_number: 25)
      ZipCode.create(zip_code: 80210)
      Trip.create(duration: 60, start_date: "24/9/2014", start_station_id: 1, end_date: "23/9/2014", end_station_id: 2, bike_id: 2, subscription_type_id: 1, zip_code_id: 1)
      Trip.create(duration: 40, start_date: "24/9/2014", start_station_id: 1, end_date: "23/9/2014", end_station_id: 1, bike_id: 2, subscription_type_id: 1, zip_code_id: 1)
      Trip.create(duration: 40, start_date: "23/9/2014", start_station_id: 2, end_date: "23/9/2014", end_station_id: 2, bike_id: 1, subscription_type_id: 1, zip_code_id: 1)
      expect(station_1.most_frequent_bike).to eq(25)
    end
  end

end