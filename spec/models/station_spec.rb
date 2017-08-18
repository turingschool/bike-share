RSpec.describe Station do
  describe "Validations" do
    it 'is invalid without a name' do
      station1 = Station.create(dock_count: 27, city: "San Jose", installation_date: "8/15/13")

      expect(station1).to_not be_valid
    end

    it 'is invalid without a dock count' do
      station1 = Station.create(name: "San Jose Civic Center", city: "San Jose", installation_date: "8/15/13")

      expect(station1).to_not be_valid
    end

    it 'is invalid without a city' do
      station1 = Station.create(name: "San Jose Civic Center", dock_count: 27, installation_date: "8/15/13")

      expect(station1).to_not be_valid
    end

    it 'is invalid without a installation date' do
      station1 = Station.create(name: "San Jose Civic Center", dock_count: 27, city: "San Jose")

      expect(station1).to_not be_valid
    end

  end
end
