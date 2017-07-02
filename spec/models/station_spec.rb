RSpec.describe Station do
  describe "Validations" do
    it "is invalid without a name" do
      station = Station.new(dock_count: 22, city_id: 3, installation_date: "11/11/11")

      expect(station).to_not be_valid
    end

    it "is invalid without a dock count" do
      station = Station.new(name: "sure", city_id: 1, installation_date: "11/11/11")

      expect(station).to_not be_valid
    end

    it "is invalid without a city" do
      station = Station.new(name: "sure", dock_count: 22, installation_date: "11/11/11")

      expect(station).to_not be_valid
    end

    it "is invalid without a installation_date" do
      station = Station.new(name: "sure", dock_count: 22, city_id: 1)

      expect(station).to_not be_valid
    end
  end
end
