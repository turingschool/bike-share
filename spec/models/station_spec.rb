RSpec.describe Station do
  describe "Validations" do
    it "validations city, name, dock_count, and installation date" do
      date = DateTime.now
      valid_station = Station.create(name: "StationOne", city_id: 1, dock_count: 10, installation_date: date)

      expect(valid_station).to be_valid

    end

    it "invalid station cannot be created with no date" do
      invalid_station = Station.create(name: "StationOne", city_id: 1, dock_count: 10)

      expect(invalid_station).to_not be_valid
    end

    it 'invalid station cannot be created without name' do
      date = DateTime.now
      invalid_station = Station.create(city_id: 1, dock_count: 10, installation_date: date)

      expect(invalid_station).to_not be_valid
    end

    it 'invalid station cannot be created without city_id' do
      date = DateTime.now
      invalid_station = Station.create(name: "StationOne", dock_count: 10, installation_date: date)

      expect(invalid_station).to_not be_valid
    end

    it 'invalid station cannot be created without dock_count' do
      date = DateTime.now
      invalid_station = Station.create(name: "StationOne", city_id: 1, installation_date: date)

      expect(invalid_station).to_not be_valid
    end
  end
end
