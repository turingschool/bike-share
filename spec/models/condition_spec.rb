describe Condition do
  describe "Class Methods" do
    it ".avg_rides_by_weather" do

      Trip.create(duration: 174,
                  start_date: "2013-08-29",
                  start_station_name: "Panera",
                  end_date: "2013-08-29 09:11:00",
                  end_station_name: "Turing",
                  bike_id: 288,
                  start_station_id: 1,
                  end_station_id: 2,
                  subscription_type: "Subscriber",
                  zip_code: "94114")

      Trip.create(duration: 174,
                  start_date: "2013-08-30",
                  start_station_name: "Turing",
                  end_date: "2013-08-29 09:11:00",
                  end_station_name: "King Sooper",
                  bike_id: 288,
                  start_station_id: 2,
                  end_station_id: 3,
                  subscription_type: "Subscriber",
                  zip_code: "94114")

      Trip.create(duration: 174,
                  start_date: "2013-08-30",
                  start_station_name: "Trader Joes",
                  end_date: "2013-08-29 09:11:00",
                  end_station_name: "Turing",
                  bike_id: 288,
                  start_station_id: 4,
                  end_station_id: 4,
                  subscription_type: "Subscriber",
                  zip_code: "94114")

      Trip.create(duration: 174,
                  start_date: "2013-08-30",
                  start_station_name: "Panera",
                  end_date: "2013-08-29 09:11:00",
                  end_station_name: "Turing",
                  bike_id: 288,
                  start_station_id: 1,
                  end_station_id: 1,
                  subscription_type: "Subscriber",
                  zip_code: "94114")

      Trip.create(duration: 174,
                  start_date: "2013-08-29",
                  start_station_name: "Turing",
                  end_date: "2013-08-29 09:11:00",
                  end_station_name: "Turing",
                  bike_id: 288,
                  start_station_id: 2,
                  end_station_id: 2,
                  subscription_type: "Subscriber",
                  zip_code: "94114")

      Trip.create(duration: 174,
                  start_date: "2013-08-29",
                  start_station_name: "Panera",
                  end_date: "2013-08-29 09:11:00",
                  end_station_name: "Panera",
                  bike_id: 288,
                  start_station_id: 1,
                  end_station_id: 1,
                  subscription_type: "Subscriber",
                  zip_code: "94114")

      Condition.create(date:'2013-08-29',
                   max_temperature: 70,
                   mean_temperature: 65,
                   min_temperature: 60,
                   mean_humidity: 40,
                   mean_visibility: 20,
                   mean_windspeed: 50,
                   precipitation:  3,
                   zip_code: 95113)

      Condition.create(date:'2013-08-29',
                   max_temperature: 77,
                   mean_temperature: 67,
                   min_temperature: 65,
                   mean_humidity: 43,
                   mean_visibility: 22,
                   mean_windspeed: 30,
                   precipitation:  1,
                   zip_code: 95113)

      Condition.create(date:'2013-08-29',
                  max_temperature: 70,
                  mean_temperature: 65,
                  min_temperature: 60,
                  mean_humidity: 40,
                  mean_visibility: 20,
                  mean_windspeed: 50,
                  precipitation:  3,
                  zip_code: 95113)


      Condition.create(date:'2013-08-30',
                  max_temperature: 77,
                  mean_temperature: 67,
                  min_temperature: 65,
                  mean_humidity: 43,
                  mean_visibility: 22,
                  mean_windspeed: 30,
                  precipitation:  1,
                  zip_code: 95113)

      require 'pry';binding.pry
      expect(Condition.avg_rides_by_weather(70.0)).to eq(1.5)

    end
  end
end

