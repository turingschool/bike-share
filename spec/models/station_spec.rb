require 'pry'
RSpec.describe Station do
  describe "Validations" do
    it "validations city, name, dock_count, and installation date" do
      date = DateTime.now
      valid_station = Station.create(name: "StationOne", city_id: 1, dock_count: 10, installation_date: date)

      expect(valid_station).to be_valid

    end

    it "invalid station cannot be created with no date" do
      invalid_station = Station.create(name: "StationOne", city_id: 1, dock_count: 10)

      expect(invalid_station).to_not be_valid
    end

    it 'invalid station cannot be created without name' do
      date = DateTime.now
      invalid_station = Station.create(city_id: 1, dock_count: 10, installation_date: date)

      expect(invalid_station).to_not be_valid
    end

    it 'invalid station cannot be created without city_id' do
      date = DateTime.now
      invalid_station = Station.create(name: "StationOne", dock_count: 10, installation_date: date)

      expect(invalid_station).to_not be_valid
    end

    it 'invalid station cannot be created without dock_count' do
      date = DateTime.now
      invalid_station = Station.create(name: "StationOne", city_id: 1, installation_date: date)

      expect(invalid_station).to_not be_valid
    end
  end

  describe "Class Methods" do
    it "returns average bikes per station" do
      date = DateTime.now
      Station.create(name: "StationOne", city_id: 1, dock_count: 10, installation_date: date)
      Station.create(name: "StationTwo", city_id: 2, dock_count: 20, installation_date: date)

      expect(Station.average_per_station).to eq(15)
    end

    it "returns most bikes available at a station" do
      date = DateTime.now
      Station.create(name: "StationOne", city_id: 1, dock_count: 10, installation_date: date)
      Station.create(name: "StationTwo", city_id: 2, dock_count: 20, installation_date: date)

      expect(Station.most_bikes_available_at_station).to eq(20)
    end

    it "returns stations with most bikes" do
      date = DateTime.now
      Station.create(name: "StationOne", city_id: 1, dock_count: 10, installation_date: date)
      Station.create(name: "StationTwo", city_id: 2, dock_count: 20, installation_date: date)
      expect(Station.stations_with_most_bikes.first.name).to eq("StationTwo")
    end

    it "returns fewest bikes at a station" do
      date = DateTime.now
      Station.create(name: "StationOne", city_id: 1, dock_count: 10, installation_date: date)
      Station.create(name: "StationTwo", city_id: 2, dock_count: 20, installation_date: date)
      expect(Station.least_bikes_available_at_station).to eq(10)
    end

    it "stations where fewest bikes are available" do
      date = DateTime.now
      Station.create(name: "StationOne", city_id: 1, dock_count: 10, installation_date: date)
      Station.create(name: "StationTwo", city_id: 2, dock_count: 20, installation_date: date)
      expect(Station.stations_with_least_bikes.first.name).to eq("StationOne")

    end

    it "returns most recently installed station" do
      date1 = DateTime.now
      date2 = DateTime.now.midnight
      Station.create(name: "StationOne", city_id: 1, dock_count: 10, installation_date: date1)
      Station.create(name: "StationTwo", city_id: 2, dock_count: 20, installation_date: date2)
      # binding.pry
      expect(Station.most_recent_installed_station.name).to eq("StationOne")
    end

    it "returns oldest station" do
      date1 = DateTime.new(2001,2,3,4,5,6)
      date2 = DateTime.new(2002,2,3,4,5,6)
      Station.create(name: "StationOne", city_id: 1, dock_count: 10, installation_date: date1)
      Station.create(name: "StationTwo", city_id: 2, dock_count: 20, installation_date: date2)
      expect(Station.oldest_station.name).to eq("StationOne")
    end

    it "returns date with highest number of trips" do
      date1 = DateTime.new(2001,2,3,4,5,6)
      date2 = DateTime.new(2002,2,3)
      condition = Condition.create(date: date2, max_temperature: 45, mean_temperature: 50, min_temperature: 20, mean_humidity: 3, mean_visibility: 3, mean_wind_speed: 20, precipitation: 1)
      station = Station.create(name: "StationOne", city_id: 1, dock_count: 10, installation_date: date1)
      Trip.create(duration: 10, start_date: date2, start_station_id: 1, end_date: date2, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345, condition_id: condition.id)
      Trip.create(duration: 10, start_date: date2, start_station_id: 1, end_date: date2, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345, condition_id: condition.id)
      Trip.create(duration: 10, start_date: date1, start_station_id: 1, end_date: date1, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345, condition_id: condition.id)

      expect(station.date_with_most_trips(1)).to eq(date2)
    end

    it "returns most frequent bike id for trips started at this station" do
      date1 = DateTime.new(2001,1,2)
      date2 = DateTime.new(2002,2,3)
      condition = Condition.create(date: date2, max_temperature: 45, mean_temperature: 50, min_temperature: 20, mean_humidity: 3, mean_visibility: 3, mean_wind_speed: 20, precipitation: 1)
      station = Station.create(name: "StationOne", city_id: 1, dock_count: 10, installation_date: date1)
      Trip.create(duration: 10, start_date: date2, start_station_id: 1, end_date: date2, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345, condition_id: condition.id)
      Trip.create(duration: 10, start_date: date2, start_station_id: 1, end_date: date2, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345, condition_id: condition.id)
      Trip.create(duration: 10, start_date: date2, start_station_id: 1, end_date: date2, end_station_id: 2, bike_id: 2, subscription_type: "Type", zip_code: 12345, condition_id: condition.id)

      expect(station.most_common_bike_id(station.id)).to eq(1)
    end

    it "returns most frequent zipcode for users started at this station" do
      date1 = DateTime.new(2001,1,2)
      date2 = DateTime.new(2002,2,3)
      condition = Condition.create(date: date2, max_temperature: 45, mean_temperature: 50, min_temperature: 20, mean_humidity: 3, mean_visibility: 3, mean_wind_speed: 20, precipitation: 1)
      station = Station.create(name: "StationOne", city_id: 1, dock_count: 10, installation_date: date1)
      Trip.create(duration: 10, start_date: date2, start_station_id: 1, end_date: date2, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345, condition_id: condition.id)
      Trip.create(duration: 10, start_date: date2, start_station_id: 1, end_date: date2, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345, condition_id: condition.id)
      Trip.create(duration: 10, start_date: date2, start_station_id: 1, end_date: date2, end_station_id: 2, bike_id: 2, subscription_type: "Type", zip_code: 44444, condition_id: condition.id)

      expect(station.most_frequent_zip_code_for_users(station.id)).to eq(12345)
    end

  end
end
