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
end
