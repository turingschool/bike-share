RSpec.describe Station do
  describe "Validations" do
    it "is invalid without a name" do
      station = Station.new(dock_count: 1, city: "Boston", installation_date: Time.now)

      expect(station).to_not be_valid
    end

    it "is invalid without a dock_count" do
      station = Station.new(name: "California", city: "Boston", installation_date: Time.now)

      expect(station).to_not be_valid
    end

    it "is invalid without a city" do
      station = Station.new(dock_count: 1, name: "Boston", installation_date: Time.now)

      expect(station).to_not be_valid
    end

    it "is invalid without a installation_date" do
      station = Station.new(dock_count: 1, city: "Boston", name: "California")

      expect(station).to_not be_valid
    end

    it "is valid with all attributes" do
     station = Station.new(name: "Gary", city:"Denver", dock_count: 2, installation_date: Time.now)

     expect(station).to be_valid
    end
  end

    describe "Class Methods" do
      describe ".fewest_bikes_available" do
      it "returns the station with the fewest bikes available based on docks" do
        Station.create(name: "Mod2BEE", dock_count: 1, installation_date: "11/4/13", city: "Chicago")
        Station.create(name: "Mod1BEE", dock_count: 5, installation_date: "12/7/14", city: "Chicago")
        Station.create(name: "Mod3BEE", dock_count: 3, installation_date: "1/23/12", city: "Chicago")

        result = Station.fewest_bikes_available

        expect(result[0].name).to eq("Mod2BEE")
      end
      it "returns the stations with the fewest bikes available based on docks" do
        Station.create(name: "Mod2BEE", dock_count: 1, installation_date: "11/4/13", city: "Chicago")
        Station.create(name: "Mod1BEE", dock_count: 1, installation_date: "12/7/14", city: "Chicago")
        Station.create(name: "Mod3BEE", dock_count: 5, installation_date: "1/23/12", city: "Chicago")

        result = Station.fewest_bikes_available

        expect(result.count).to eq(2)
        expect(result[0].class).to eq(Station)
      end
    end
  end
end
