RSpec.describe Condition do
  describe ".sort_temp_max" do
    it "finds the max amount of trips for a given range" do
      start_date = DateTime.new(2001,2,3,4,5,6)
      Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: start_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345)
      Trip.create(duration: 20, start_date: start_date, start_station_id: 2, end_date: start_date, end_station_id:3, bike_id: 2, subscription_type: "Type", zip_code: 12345)
      Condition.create(date: start_date, max_temperature: 45, mean_temperature: 50, min_temperature: 20, mean_humidity: 3, mean_visibility: 3, mean_wind_speed: 20, precipitation: 1)
      Condition.create(date: start_date, max_temperature: 55, mean_temperature: 40, min_temperature: 10, mean_humidity: 2, mean_visibility: 2, mean_wind_speed: 10, precipitation: 2)

      expect(Condition.sort_temp_max(40..60)).to eq(1)
    end
  end

  describe ".sort_wind_mean" do
    it 'finds the average amount of trips for a given wind_speed range' do
      start_date = DateTime.new(2001,2,3,4,5,6)
      condition_1 = Condition.create!(date: start_date, max_temperature: 45, mean_temperature: 50, min_temperature: 20, mean_humidity: 3, mean_visibility: 3, mean_wind_speed: 4, precipitation: 1)
      condition_2 = Condition.create!(date: start_date, max_temperature: 55, mean_temperature: 40, min_temperature: 10, mean_humidity: 2, mean_visibility: 2, mean_wind_speed: 6, precipitation: 2)
      Trip.create(duration: 10, start_date: start_date, start_station_id: 1, end_date: start_date, end_station_id: 2, bike_id: 1, subscription_type: "Type", zip_code: 12345, condition_id: condition_1)
      Trip.create(duration: 20, start_date: start_date, start_station_id: 2, end_date: start_date, end_station_id:3, bike_id: 2, subscription_type: "Type", zip_code: 12345, condition_id: condition_2)

      expect(Condition.sort_wind_mean(2..10)).to eq(5)
    end
  end

end
