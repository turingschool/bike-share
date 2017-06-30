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

    it "is invalid without an installation_date" do
      station = Station.new(name: "mission", dock_count: 30, city_id: 3)

      expect(station).to_not be_valid
    end
  end
end
