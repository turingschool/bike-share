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