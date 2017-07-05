RSpec.describe Station do
  describe "class methods" do
    it ".total_station_count" do
      station_name = StationName.create(name: "Test Station")
      install_date = BikeShareDate.create(bike_share_date: "2013-08-06 00:00:00")
      city = City.create(name: "Denver")
      station = Station.create(station_name_id: station_name.id, dock_count: 99, city_id: city.id,
                installation_date_id: install_date.id)

        result = Station.total_station_count

        expect(result).to eq(1)
    end
  end

  describe "instance methods" do
    context "#installation_date returns date" do
      it "returns date from bike_share_dates table" do
        install_date = BikeShareDate.create(bike_share_date: "2013-08-06 00:00:00")
        city = City.new(name: "Denver")
        station = Station.create(station_name_id: 1, dock_count: 99, city_id: city.id,
                  installation_date_id: install_date.id)

        result = station.installation_date

        expect(result).to eq("2013-08-06 00:00:00")
      end
    end

    describe "#name returns station name" do
      it "returns name from station_name table" do
        station_name= StationName.create(name: "Bret")
        station = Station.create(station_name_id: station_name.id, dock_count: 99, city_id: 1,
                  installation_date_id: 1)
        result = station.name

        expect(result).to eq("Bret")
      end
    end

    describe "#city returns city name" do
      it "returns name from cities table" do
        city = City.create(name: "Denver")
        station = Station.create(station_name_id: 1, dock_count: 99, city_id: city.id,
                  installation_date_id: 1)

        result = station.city

        expect(result).to eq("Denver")
      end
    end
  end

  describe "validations" do
    it "is invalid without a name" do
      install_date = BikeShareDate.new(bike_share_date: 2120-07-05)
      city = City.new(name: "Denver")
      station = Station.new(dock_count: 99, city_id: city.id,
                installation_date_id: install_date.id)

      expect(station).to_not be_valid
    end

    it "is invalid without an install date" do
      station_name = StationName.new(name: "Test Station")
      city = City.new(name: "Denver")
      station = Station.new(station_name_id: station_name.id, dock_count: 99, city_id: city.id)

      expect(station).to_not be_valid
    end

    it "it is invalid without a city" do
      station_name = StationName.new(name: "Test Station")
      install_date = BikeShareDate.new(bike_share_date: 2120-07-05)
      station = Station.new(station_name_id: station_name.id, dock_count: 99,
                installation_date_id: install_date.id)

      expect(station).to_not be_valid
    end

    it "is invalid without a dock count" do
      station_name = StationName.new(name: "Test Station")
      install_date = BikeShareDate.new(bike_share_date: 2120-07-05)
      city = City.new(name: "Denver")
      station = Station.new(station_name_id: station_name.id, city_id: city.id,
                installation_date_id: install_date.id)

      expect(station).to_not be_valid
    end
  end
end
