RSpec.describe Station do
  describe "validations" do
    it "can exist with valid attributes" do
      station = Station.create(name: "Turing", city: "Hell", installation_date: "4/20/1969", dock_count: 69)

      expect(station.name).to eq("Turing")
      expect(station.city).to eq("Hell")
      expect(station.installation_date).to eq("4/20/1969")
      expect(station.dock_count).to eq(69)
      expect(Station.count).to eq(1)
    end
  end
end
