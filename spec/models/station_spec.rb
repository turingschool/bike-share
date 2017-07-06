RSpec.describe Station do
  describe "Validations" do
    it "is invalid without a name" do
      station = Station.new(dock_count: 30, city_id: 2, installation_date: 3/4/15)

      expect(station).to_not be_valid
    end

    it "is invalid without a dock_count" do
      station = Station.new(name: "mission", city_id: 2, installation_date: 3/4/15)

      expect(station).to_not be_valid
    end

    it "is invalid without a city_id" do
      station = Station.new(name: "mission", dock_count: 30, installation_date: 3/4/15)

      expect(station).to_not be_valid
    end
  end
  describe "Class Methods" do
    before :each do
      Station.create(name: "Mission", dock_count: 30, city_id: 2, installation_date: "1/4/15")
      Station.create(name: "Embarcadero", dock_count: 50, city_id: 2, installation_date: "3/4/16")
      Station.create(name: "Rockridge", dock_count: 15, city_id: 3, installation_date: "5/4/17")
      Station.create(name: "Marina", dock_count: 15, city_id: 5, installation_date: "5/1/16")
    end

    describe ".average_dock_count" do
      it "returns average dock count" do
        expect(Station.average_dock_count).to eq(28)
      end
    end
    describe ".most_bikes" do
      it "returns highest # of bikes" do
        expect(Station.most_bikes).to eq(50)
      end
    end
    describe ".stations_with_most_bikes" do
      it "returns array of station names with most bikes" do
        expect(Station.stations_with_most_bikes).to eq(["Embarcadero"])
      end
    end
    describe ".least_bikes" do
      it "returns the highest number of docks" do
        expect(Station.least_bikes).to eq(15)
      end
    end
    describe ".stations_with_least_bikes" do
      it "returns array of station names with most bikes" do
        expect(Station.stations_with_least_bikes).to eq(["Rockridge", "Marina"])
      end
    end
    describe ".newest_stations" do
      it "returns array of newest station names" do
        expect(Station.newest_stations).to eq(["Rockridge"])
      end
    end
    describe ".oldest_stations" do
      it "returns an array of oldest station names" do
        expect(Station.oldest_stations).to eq(["Mission"])
      end
    end
  end

  describe "Relationships" do
    it ".city returns the name of the city" do
      station = Station.create(name: "Santa Clara at Almaden", dock_count: 11, city_id: 1, installation_date: "2013-06-08")
      diego = City.create(city: "San Diego")

      expect(station.city).to eq(diego)
    end
  end
end
