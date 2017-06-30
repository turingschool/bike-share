RSpec.describe Station do
  describe "Class Methods" do
    describe "name" do
      it "returns names for stations"
      station = Station.create(name: "Penn", dock_count: 32, city: "New York", installation_date: "8/6/2013")

      expect(station.name).to eq("Penn")
    end

    describe "city" do
      it "returns cities for stations"

    end
  end
end
