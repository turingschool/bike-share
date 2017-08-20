RSpec.describe Station do
  describe "Validations" do
    it "is valid with all information"do
      station = Station.new(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")

      expect(station).to be_valid
    end

    it "is invalid without a name" do
      station = Station.new(dock_count: 20, city: "bike town", installation_date: "4/10/16")

      expect(station).to_not be_valid
    end

    it "is invalid without a dock_count" do
      station = Station.new(name: "Station_1", city: "bike town", installation_date: "4/10/16")

      expect(station).to_not be_valid
    end

    it "is invalid without a city" do
      station = Station.new(name: "Station_1", dock_count: 20, installation_date: "4/10/16")

      expect(station).to_not be_valid
    end

    it "is invalid without an installation date" do
      station = Station.new(name: "Station_1", city: "bike town", dock_count: 20)

      expect(station).to_not be_valid
    end
  end

  describe "Class Methods" do
    it "will show average number of bikes across stations" do
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      station = Station.create(name: "Station_2", dock_count: 30, city: "bike town", installation_date: "3/4/15")

      expect(Station.average_bikes).to eq(25)
    end

    it "will show the most bikes at a station" do
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      station = Station.create(name: "Station_2", dock_count: 30, city: "bike town", installation_date: "3/4/15")

      expect(Station.most_bikes).to eq(30)
    end

    it "will show the station with the most bikes" do
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      station = Station.create(name: "Station_2", dock_count: 30, city: "bike town", installation_date: "3/4/15")

      expect(Station.station_with_most_bikes).to eq("Station_2")
    end

    it "will show the least bikes at a station" do
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      station = Station.create(name: "Station_2", dock_count: 30, city: "bike town", installation_date: "3/4/15")

      expect(Station.fewest_bikes).to eq(20)
    end

    it "will show the station with the least bikes" do
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      station = Station.create(name: "Station_2", dock_count: 30, city: "bike town", installation_date: "3/4/15")

      expect(Station.station_with_fewest_bikes).to eq("Station_1")
    end

    it "will show the most recent station" do
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/3/15")
      station = Station.create(name: "Station_2", dock_count: 30, city: "bike town", installation_date: "3/4/15")

      expect(Station.most_recent_station).to eq("Station_2")
    end

    it "will show the oldest_station" do
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/3/15")
      station = Station.create(name: "Station_2", dock_count: 30, city: "bike town", installation_date: "3/4/15")

      expect(Station.oldest_station).to eq("Station_1")
    end
  end
end
