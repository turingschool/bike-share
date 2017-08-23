RSpec.describe Condition do
  describe ".sort_temp_max" do
    it "finds the max amount of trips for a given range" do
      start_date = DateTime.new(2001,2,3,4,5,6)
      t_1 = Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: start_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)
      t_2 = Trip.create(duration: 20, start_date: start_date, start_station_id: 2, end_date: start_date, end_station_id:3, bike_id: 2, subscription_type: "Type", zip_code: 12345)
      c_1 = Condition.create(date: start_date, max_temperature: 45, mean_temperature: 50, min_temperature: 20, mean_humidity: 3, mean_visibility: 3, mean_wind_speed: 20, precipitation: 1, trip_id: t_1.id)
      c_2 = Condition.create(date: start_date, max_temperature: 55, mean_temperature: 40, min_temperature: 10, mean_humidity: 2, mean_visibility: 2, mean_wind_speed: 10, precipitation: 2, trip_id: t_2.id)
      t_1.update(condition_id: c_1.id)
      t_2.update(condition_id: c_2.id)

      expect(Condition.sort_temp_max(40..60)).to eq(2)
    end
  end

  describe ".sort_temp_min" do
    it 'finds the amount of trips for a given min temp range' do
      start_date = DateTime.new(2001,2,3,4,5,6)
      t_1 = Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: start_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)
      t_2 = Trip.create(duration: 20, start_date: start_date, start_station_id: 2, end_date: start_date, end_station_id:3, bike_id: 2, subscription_type: "Type", zip_code: 12345)
      c_1 = Condition.create(date: start_date, max_temperature: 45, mean_temperature: 50, min_temperature: 20, mean_humidity: 3, mean_visibility: 3, mean_wind_speed: 20, precipitation: 1, trip_id: t_1.id)
      c_2 = Condition.create(date: start_date, max_temperature: 55, mean_temperature: 40, min_temperature: 10, mean_humidity: 2, mean_visibility: 2, mean_wind_speed: 10, precipitation: 2, trip_id: t_2.id)
      t_1.update(condition_id: c_1.id)
      t_2.update(condition_id: c_2.id)

      expect(Condition.sort_temp_min(1..12)).to eq(1)
    end
  end

  describe ".sort_temp_mean" do
    it 'finds the average amount of trips for a given temp range' do
      start_date = DateTime.new(2001,2,3,4,5,6)
      t_1 = Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: start_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)
      t_2 = Trip.create(duration: 20, start_date: start_date, start_station_id: 2, end_date: start_date, end_station_id:3, bike_id: 2, subscription_type: "Type", zip_code: 12345)
      c_1 = Condition.create(date: start_date, max_temperature: 45, mean_temperature: 50, min_temperature: 20, mean_humidity: 3, mean_visibility: 3, mean_wind_speed: 20, precipitation: 1, trip_id: t_1.id)
      c_2 = Condition.create(date: start_date, max_temperature: 55, mean_temperature: 40, min_temperature: 10, mean_humidity: 2, mean_visibility: 2, mean_wind_speed: 10, precipitation: 2, trip_id: t_2.id)
      t_1.update(condition_id: c_1.id)
      t_2.update(condition_id: c_2.id)

      expect(Condition.sort_temp_mean(35..60)).to eq(2)
    end
  end

  describe ".sort_wind_max" do
    it 'finds the max amount of trips for a given wind_speed range' do
      start_date = DateTime.new(2001,2,3,4,5,6)
      t_1 = Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: start_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)
      t_2 = Trip.create(duration: 20, start_date: start_date, start_station_id: 2, end_date: start_date, end_station_id:3, bike_id: 2, subscription_type: "Type", zip_code: 12345)
      c_1 = Condition.create(date: start_date, max_temperature: 45, mean_temperature: 50, min_temperature: 20, mean_humidity: 3, mean_visibility: 3, mean_wind_speed: 20, precipitation: 1, trip_id: t_1.id)
      c_2 = Condition.create(date: start_date, max_temperature: 55, mean_temperature: 40, min_temperature: 10, mean_humidity: 2, mean_visibility: 2, mean_wind_speed: 10, precipitation: 2, trip_id: t_2.id)
      t_1.update(condition_id: c_1.id)
      t_2.update(condition_id: c_2.id)

      expect(Condition.sort_wind_max(2..10)).to eq(1)
    end
  end

  describe ".sort_wind_min" do
    it 'finds the min amount of trips for a given wind_speed range' do
      start_date = DateTime.new(2001,2,3,4,5,6)
      t_1 = Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: start_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)
      t_2 = Trip.create(duration: 20, start_date: start_date, start_station_id: 2, end_date: start_date, end_station_id:3, bike_id: 2, subscription_type: "Type", zip_code: 12345)
      c_1 = Condition.create(date: start_date, max_temperature: 45, mean_temperature: 50, min_temperature: 20, mean_humidity: 3, mean_visibility: 3, mean_wind_speed: 20, precipitation: 1, trip_id: t_1.id)
      c_2 = Condition.create(date: start_date, max_temperature: 55, mean_temperature: 40, min_temperature: 10, mean_humidity: 2, mean_visibility: 2, mean_wind_speed: 10, precipitation: 2, trip_id: t_2.id)
      t_1.update(condition_id: c_1.id)
      t_2.update(condition_id: c_2.id)

      expect(Condition.sort_wind_min(15..25)).to eq(1)
    end
  end

  describe ".sort_wind_mean" do
    it 'finds the average amount of trips for a given wind_speed range' do
      start_date = DateTime.new(2001,2,3,4,5,6)
      t_1 = Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: start_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)
      t_2 = Trip.create(duration: 20, start_date: start_date, start_station_id: 2, end_date: start_date, end_station_id:3, bike_id: 2, subscription_type: "Type", zip_code: 12345)
      c_1 = Condition.create(date: start_date, max_temperature: 45, mean_temperature: 50, min_temperature: 20, mean_humidity: 3, mean_visibility: 3, mean_wind_speed: 20, precipitation: 1, trip_id: t_1.id)
      c_2 = Condition.create(date: start_date, max_temperature: 55, mean_temperature: 40, min_temperature: 10, mean_humidity: 2, mean_visibility: 2, mean_wind_speed: 10, precipitation: 2, trip_id: t_2.id)
      t_1.update(condition_id: c_1.id)
      t_2.update(condition_id: c_2.id)

      expect(Condition.sort_wind_mean(0..25)).to eq(1)
    end
  end

  describe ".sort_precip_max" do
    it 'finds the max amount of trips for a given precipitation range' do
      start_date = DateTime.new(2001,2,3,4,5,6)
      t_1 = Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: start_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)
      t_2 = Trip.create(duration: 20, start_date: start_date, start_station_id: 2, end_date: start_date, end_station_id:3, bike_id: 2, subscription_type: "Type", zip_code: 12345)
      c_1 = Condition.create(date: start_date, max_temperature: 45, mean_temperature: 50, min_temperature: 20, mean_humidity: 3, mean_visibility: 3, mean_wind_speed: 20, precipitation: 1, trip_id: t_1.id)
      c_2 = Condition.create(date: start_date, max_temperature: 55, mean_temperature: 40, min_temperature: 10, mean_humidity: 2, mean_visibility: 2, mean_wind_speed: 10, precipitation: 2, trip_id: t_2.id)
      t_1.update(condition_id: c_1.id)
      t_2.update(condition_id: c_2.id)

      expect(Condition.sort_precip_max(1..2)).to eq(2)
    end
  end
end
