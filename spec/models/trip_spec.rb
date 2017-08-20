RSpec.describe Trip do
  describe "Validations" do
    it "validations duration, start_date, start_station_id, end_date, end_station_id, bike_id, subscription_type, zip_code" do
      start_date = DateTime.new(2001,2,3,4,5,6)
      end_date = DateTime.new(2001,2,3,4,5,7)
      valid_trip = Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)

      expect(valid_trip).to be_valid
    end

    it "invalid trip cannot be created with no duration" do
      start_date = DateTime.new(2001,2,3,4,5,6)
      end_date = DateTime.new(2001,2,3,4,5,7)
      invalid_trip = Trip.create(start_date: start_date, start_station_id: 1, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)

      expect(invalid_trip).to_not be_valid
    end

    it "invalid trip cannot be created with no start date" do
      end_date = DateTime.new(2001,2,3,4,5,7)
      invalid_trip = Trip.create(start_station_id: 1, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)

      expect(invalid_trip).to_not be_valid
    end

    it "invalid trip cannot be created with no start station id" do
      start_date = DateTime.new(2001,2,3,4,5,6)
      end_date = DateTime.new(2001,2,3,4,5,7)
      invalid_trip = Trip.create(duration: 10, start_date: start_date, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)

      expect(invalid_trip).to_not be_valid
    end

    it 'invalid trip cannot be created with no end date' do
      start_date = DateTime.new(2001,2,3,4,5,6)
      end_date = DateTime.new(2001,2,3,4,5,7)
      invalid_trip = Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)

      expect(invalid_trip).to_not be_valid
    end

    it 'invalid trip cannot be created with no end station id' do
      start_date = DateTime.new(2001,2,3,4,5,6)
      end_date = DateTime.new(2001,2,3,4,5,7)
      invalid_trip = Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: end_date, bike_id: 1, subscription_type: "Type", zip_code: 12345)

      expect(invalid_trip).to_not be_valid
    end

    it 'invalid trip cannot be created with no bike id' do
      start_date = DateTime.new(2001,2,3,4,5,6)
      end_date = DateTime.new(2001,2,3,4,5,7)
      invalid_trip = Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: end_date, end_station_id: 2, subscription_type: "Type", zip_code: 12345)

      expect(invalid_trip).to_not be_valid
    end

    it 'invalid trip cannot be created with no subscription type' do
      start_date = DateTime.new(2001,2,3,4,5,6)
      end_date = DateTime.new(2001,2,3,4,5,7)
      invalid_trip = Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: end_date, end_station_id: 2, bike_id: 1, zip_code: 12345)

      expect(invalid_trip).to_not be_valid
    end
  end
end
