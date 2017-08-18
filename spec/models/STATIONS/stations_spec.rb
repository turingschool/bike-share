RSpec.describe Station do
  describe "validations" do
    it "can exist with valid attributes" do
      station = Station.create(name: "Turing", city: "Hell", installation_date: "1969/4/20", dock_count: 69)

      expect(station.name).to eq("Turing")
      expect(station.city).to eq("Hell")
      expect(station.installation_date).to eq("1969/4/20")
      expect(station.dock_count).to eq(69)
      expect(Station.count).to eq(1)
    end
  end

  describe "in-validations" do
    it "will not created without a name" do
      station = Station.create(city: "Hell", installation_date: "1969/4/20", dock_count: 69)

      expect(Station.count).to eq(0)
      expect(station).to_not be_valid
    end

    it "will not be created without city" do
      station = Station.create(name: "Turing", installation_date: "1969/4/20", dock_count: 69)

      expect(Station.count).to eq(0)
      expect(station).to_not be_valid
    end

    it "will not be created without installation_date" do
      station = Station.create(name: "Turing", city: "Hell", dock_count: 69)

      expect(Station.count).to eq(0)
      expect(station).to_not be_valid
    end

    it "will not be created without dock_count" do
      station = Station.create(name: "Turing", city: "Hell", installation_date: "1969/4/20")

      expect(Station.count).to eq(0)
      expect(station).to_not be_valid
    end
  end
end
