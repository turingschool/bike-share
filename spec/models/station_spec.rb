<<<<<<< HEAD
class StationSpec < Rspec::Base
  Rspec.describe "Iteration 3" do
    it "Calculates total stations" do
      total = Station.total

      expect(total).to_eq(84)
    end

    it "Calculates average available bikes per station" do
      average = Station.average_bikes_per_station

      expect(average).to_eq(...)
    end

    it "Calculates available bikes for station" do
      station = Station.find_by_id(1)
      average = station.available_bikes

      expect(average).to_eq(...)
    end

    it "Calculates most bikes available at station" do
      max = Station.max_bikes

      expect(max).to_eq(...)
    end
  end
=======
describe Station do
  describe "Validations" do
    it "is invalid without a name" do
      station = Station.create(dock_count: 15, city_id: 1, installation_date: "8/5/2013")

      expect(station).to_not be_valid
    end
    it "is invalid without a dock count" do
      station = Station.create(name: "test", city_id: 1, installation_date: "8/5/2013")

      expect(station).to_not be_valid
    end
    it "is invalid without a city_id" do
      station = Station.create(name: "test", dock_count: 15, installation_date: "8/5/2013")

      expect(station).to_not be_valid
    end
    it "is invalid without an installation date" do
      station = Station.create(name: "test", dock_count: 15, city_id: 1)

      expect(station).to_not be_valid
    end
  end
  describe "Methods" do
    it "can calculate average bikes" do
      station1 = Station.create(name: "Test", dock_count: 10, city_id: 1, installation_date: "8/5/2013")
      station2 = Station.create(name: "Test 2", dock_count: 20, city_id: 1, installation_date: "8/2/2013")

      expect(Station.average_bikes_available).to eq(15)
    end
    it "can find the station with the most bikes" do
      station1 = Station.create(name: "Test", dock_count: 10, city_id: 1, installation_date: "8/5/2013")
      station2 = Station.create(name: "Test 2", dock_count: 20, city_id: 1, installation_date: "8/2/2013")

      expect(Station.stations_with_most_bikes).to include(station2)
    end
    it "can find the station with the least bikes" do
      station1 = Station.create(name: "Test", dock_count: 10, city_id: 1, installation_date: "8/5/2013")
      station2 = Station.create(name: "Test 2", dock_count: 20, city_id: 1, installation_date: "8/2/2013")

      expect(Station.stations_with_least_bikes).to include(station1)
    end
    it "can find the station installed most recently" do
      station1 = Station.create(name: "Test", dock_count: 10, city_id: 1, installation_date: "8/5/2013")
      station2 = Station.create(name: "Test 2", dock_count: 20, city_id: 1, installation_date: "8/2/2013")

      expect(Station.most_recent_station).to include(station1)
    end
    it "can find the oldest station" do
      station1 = Station.create(name: "Test", dock_count: 10, city_id: 1, installation_date: "8/5/2013")
      station2 = Station.create(name: "Test 2", dock_count: 20, city_id: 1, installation_date: "8/2/2013")

      expect(Station.oldest_station).to include(station2)
    end
  end
end
>>>>>>> 24a49870e6bc992736b3a1f220055ec28ac3fd9f
