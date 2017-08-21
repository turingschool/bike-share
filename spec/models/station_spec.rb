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
