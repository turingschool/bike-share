describe Station do
  describe "Validations" do
    it "is invalid without a name" do
      station = Station.create(dock_count: 15, city_id: 1, installation_date: 8/5/2013)

      expect(station).to_not be_valid
    end
    it "is invalid without a dock count" do
      station = Station.create(name: "test", city_id: 1, installation_date: 8/5/2013)

      expect(station).to_not be_valid
    end
    it "is invalid without a city_id" do
      station = Station.create(name: "test", dock_count: 15, installation_date: 8/5/2013)

      expect(station).to_not be_valid
    end
    it "is invalid without an installation date" do
      station = Station.create(name: "test", dock_count: 15, city_id: 1)

      expect(station).to_not be_valid
    end
  end
end