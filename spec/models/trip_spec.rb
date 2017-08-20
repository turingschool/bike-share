RSpec.describe Trip do
  describe "Validations" do
    it "validations duration, start_date, start_station_id, end_date, end_station_id, bike_id, subscription_type, zip_code" do
      start_date = DateTime.new(2001,2,3,4,5,6)
      end_date = DateTime.new(2001,2,3,4,5,7)
      valid_trip = Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)

      expect(valid_trip).to be_valid
    end
  end
end

    # it "invalid station cannot be created with no date" do
    #   invalid_station = Trip.create(name: "StationOne", city_id: 1, dock_count: 10)
    #
    #   expect(invalid_station).to_not be_valid
    # end
    #
    # it 'invalid station cannot be created without name' do
    #   date = DateTime.now
    #   invalid_station = Trip.create(city_id: 1, dock_count: 10, installation_date: date)
    #
    #   expect(invalid_station).to_not be_valid
    # end
    #
    # it 'invalid station cannot be created without city_id' do
    #   date = DateTime.now
    #   invalid_station = Trip.create(name: "StationOne", dock_count: 10, installation_date: date)
    #
    #   expect(invalid_station).to_not be_valid
    # end
    #
    # it 'invalid station cannot be created without dock_count' do
    #   date = DateTime.now
    #   invalid_station = Trip.create(name: "StationOne", city_id: 1, installation_date: date)
    #
    #   expect(invalid_station).to_not be_valid
    # end
