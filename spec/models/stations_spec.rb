RSpec.describe Station do
  xdescribe "Validations" do
    it "is valid with all information"do
      station = Station.new(name: "Station_1", dock_count: 20, city: "bike town", installation_date: 3/4/15)

      expect(station).to be_valid
    end

    it "is invalid without a name" do
      station = Station.new(dock_count: 20, city: "bike town", installation_date: 4/10/16)

      expect(station).to_not be_valid
    end

    it "is invalid without a dock_count" do
      station = Station.new(name: "Station_1", city: "bike town", installation_date: 4/10/16)

      expect(station).to_not be_valid
    end

    it "is invalid without a city" do
      station = Station.new(name: "Station_1", dock_count: 20, installation_date: 4/10/16)

      expect(station).to_not be_valid
    end
  end
end
