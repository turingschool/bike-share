RSpec.describe Station do
  describe "Validations" do

      it "is valid with name, dock count, city and installation date" do
      station = Station.new(name: "Penn Station", dock_count: 32, city: "New York")

      expect(station).to be_valid
    end

      it "is invalid if missing name" do
        station = Station.new(dock_count: 32, city: "New York")

        expect(station).to_not be_valid
      end


  end
end
