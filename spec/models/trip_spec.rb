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

  describe "Class Methods" do
    it "returns average duration of ride" do
      start_date = DateTime.new(2001,2,3,4,5,6)
      end_date = DateTime.new(2001,2,3,4,5,7)
      Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)
      Trip.create(duration: 20, start_date: start_date, start_station_id: 1, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)

      expect(Trip.average_duration_of_ride).to eq(15)
    end

    it "returns longest ride" do
      start_date = DateTime.new(2001,2,3,4,5,6)
      end_date = DateTime.new(2001,2,3,4,5,7)
      Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)
      Trip.create(duration: 20, start_date: start_date, start_station_id: 1, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)

      expect(Trip.longest_ride).to eq(20)
    end

    it "returns shortest ride" do
      start_date = DateTime.new(2001,2,3,4,5,6)
      end_date = DateTime.new(2001,2,3,4,5,7)
      Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)
      Trip.create(duration: 20, start_date: start_date, start_station_id: 1, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)

      expect(Trip.shortest_ride).to eq(10)
    end

    it "returns station with most rides as a starting place" do
      start_date = DateTime.new(2001,2,3,4,5,6)
      end_date = DateTime.new(2001,2,3,4,5,7)
      date = DateTime.new(2000,2,3,4,5,7)
      station_1 = Station.create(name: "StationOne", city_id: 1, dock_count: 10, installation_date: date)
      station_2 = Station.create(name: "StationTwo", city_id: 1, dock_count: 10, installation_date: date)
      Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)
      Trip.create(duration: 20, start_date: start_date, start_station_id: 1, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)
      Trip.create(duration: 20, start_date: start_date, start_station_id: 2, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)

      expect(Trip.station_with_most_rides_as_starting_place).to eq(station_1)
    end

    it "returns station with most rides as a starting place" do
      start_date = DateTime.new(2001,2,3,4,5,6)
      end_date = DateTime.new(2001,2,3,4,5,7)
      date = DateTime.new(2000,2,3,4,5,7)
      station_1 = Station.create(name: "StationOne", city_id: 1, dock_count: 10, installation_date: date)
      station_2 = Station.create(name: "StationTwo", city_id: 1, dock_count: 10, installation_date: date)
      Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)
      Trip.create(duration: 20, start_date: start_date, start_station_id: 2, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)
      Trip.create(duration: 20, start_date: start_date, start_station_id: 2, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)

      expect(Trip.station_with_most_rides_as_starting_place).to eq(station_2)
    end

    it 'returns the most ridden bike with total number of rides for that bike' do
      start_date = DateTime.new(2001,2,3,4,5,6)
      end_date = DateTime.new(2001,2,3,4,5,7)
      Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)
      Trip.create(duration: 20, start_date: start_date, start_station_id: 2, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)
      Trip.create(duration: 20, start_date: start_date, start_station_id: 2, end_date: end_date, end_station_id: 2, bike_id: 2, subscription_type: "Type", zip_code: 12345)

      expect(Trip.most_ridden_bike_with_total_number_of_rides).to eq([1, 2])
    end

    it 'returns the most ridden bike with total number of rides for that bike' do
      start_date = DateTime.new(2001,2,3,4,5,6)
      end_date = DateTime.new(2001,2,3,4,5,7)
      Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)
      Trip.create(duration: 20, start_date: start_date, start_station_id: 2, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)
      Trip.create(duration: 20, start_date: start_date, start_station_id: 2, end_date: end_date, end_station_id: 2, bike_id: 2, subscription_type: "Type", zip_code: 12345)

      expect(Trip.least_ridden_bike_with_total_number_of_rides).to eq([2, 1])
    end

    it 'returns subscribers with count and percentage' do
      start_date = DateTime.new(2001,2,3,4,5,6)
      end_date = DateTime.new(2001,2,3,4,5,7)
      Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Customer", zip_code: 12345)
      Trip.create(duration: 20, start_date: start_date, start_station_id: 2, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Subscriber", zip_code: 12345)
      Trip.create(duration: 20, start_date: start_date, start_station_id: 2, end_date: end_date, end_station_id: 2, bike_id: 2, subscription_type: "Subscriber", zip_code: 12345)

      expect(Trip.subscriber_count_and_percentage).to eq("Subscribers total: 2 Percentage: 66.67")
    end

    it 'returns customers with count and percentage' do
      start_date = DateTime.new(2001,2,3,4,5,6)
      end_date = DateTime.new(2001,2,3,4,5,7)
      Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Customer", zip_code: 12345)
      Trip.create(duration: 20, start_date: start_date, start_station_id: 2, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Subscriber", zip_code: 12345)
      Trip.create(duration: 20, start_date: start_date, start_station_id: 2, end_date: end_date, end_station_id: 2, bike_id: 2, subscription_type: "Subscriber", zip_code: 12345)

      expect(Trip.customer_count_and_percentage).to eq("Customers total: 1 Percentage: 33.33")
    end

    it 'returns the date with the highest number of trips' do
      start_date_1 = DateTime.new(2001,2,3,4,5,6)
      start_date_2 = DateTime.new(2001,2,3,4,5,6)
      start_date_3 = DateTime.new(2001,2,3,4,5,7)
      end_date = DateTime.new(2001,2,3,4,5,8)
      Trip.create(duration: 10, start_date: start_date_1, start_station_id: 1, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Customer", zip_code: 12345)
      Trip.create(duration: 20, start_date: start_date_2, start_station_id: 2, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Subscriber", zip_code: 12345)
      Trip.create(duration: 20, start_date: start_date_3, start_station_id: 2, end_date: end_date, end_station_id: 2, bike_id: 2, subscription_type: "Subscriber", zip_code: 12345)

      expect(Trip.date_with_highest_number_of_trips).to eq(2)
    end

    it 'returns the date with the lowest number of trips' do
      start_date_1 = DateTime.new(2001,2,3,4,5,6)
      start_date_2 = DateTime.new(2001,2,3,4,5,6)
      start_date_3 = DateTime.new(2001,2,3,4,5,7)
      end_date = DateTime.new(2001,2,3,4,5,8)
      Trip.create(duration: 10, start_date: start_date_1, start_station_id: 1, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Customer", zip_code: 12345)
      Trip.create(duration: 20, start_date: start_date_2, start_station_id: 2, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Subscriber", zip_code: 12345)
      Trip.create(duration: 20, start_date: start_date_3, start_station_id: 2, end_date: end_date, end_station_id: 2, bike_id: 2, subscription_type: "Subscriber", zip_code: 12345)

      expect(Trip.date_with_lowest_number_of_trips).to eq(1)
    end

    it 'returns month by month breakdown' do
      start_date_1 = DateTime.new(2001,2,3,4,5,6)
      start_date_2 = DateTime.new(2001,2,3,4,5,6)
      start_date_3 = DateTime.new(2001,2,3,4,5,7)
      end_date = DateTime.new(2001,2,3,4,5,8)
      Trip.create(duration: 10, start_date: start_date_1, start_station_id: 1, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Customer", zip_code: 12345)
      Trip.create(duration: 20, start_date: start_date_2, start_station_id: 2, end_date: end_date, end_station_id: 2, bike_id: 1, subscription_type: "Subscriber", zip_code: 12345)
      Trip.create(duration: 20, start_date: start_date_3, start_station_id: 2, end_date: end_date, end_station_id: 2, bike_id: 2, subscription_type: "Subscriber", zip_code: 12345)

      expect(Trip.month_by_month_breakdown).to eq({:months=>{1=>0, 2=>3, 3=>0, 4=>0, 5=>0, 6=>0, 7=>0, 8=>0, 9=>0, 10=>0, 11=>0, 12=>0}, :years=>{2013=>0, 2014=>0, 2015=>0, 2016=>0}})
    end
  end
end
