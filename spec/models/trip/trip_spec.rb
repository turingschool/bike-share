RSpec.describe "trip model test" do
  describe "Validations" do
    it "can't save trip without duration" do
      Trip.create(start_date: "2013-08-29", start_station_id: 4, 
      start_station_name: "Embarcadero", end_date: "2013-08-29", end_station_id: 5,
      end_station_name: "Market St", bike_id: 520, subscription_type: "Subscriber",
      zip_code: 94127)
    end

    it "can't save trip without Start Date" do
      Trip.create(duration: 63, start_station_id: 4,
      start_station_name: "Embarcadero", end_date: "2013-08-29", end_station_id: 5,
      end_station_name: "Market St", bike_id: 520, subscription_type: "Subscriber",
      zip_code: 94127)
    end

    it "can't save trip without Start Station id" do
      Trip.create(duration: 63, start_date: "2013-08-29",
      start_station_name: "Embarcadero", end_date: "2013-08-29", end_station_id: 5,
      end_station_name: "Market St", bike_id: 520, subscription_type: "Subscriber",
      zip_code: 94127)
    end

    it "can't save trip without Start Station name" do
      Trip.create(duration: 63, start_date: "2013-08-29", start_station_id: 4,
      end_date: "2013-08-29", end_station_id: 5,
      end_station_name: "Market St", bike_id: 520, subscription_type: "Subscriber",
      zip_code: 94127)
    end

    it "can't save trip without end date" do
      Trip.create(duration: 63, start_date: "2013-08-29", start_station_id: 4,
      start_station_name: "Embarcadero", end_station_id: 5,
      end_station_name: "Market St", bike_id: 520, subscription_type: "Subscriber",
      zip_code: 94127)
    end

    it "can't save trip without end station id" do
      Trip.create(duration: 63, start_date: "2013-08-29", start_station_id: 4,
      start_station_name: "Embarcadero", end_date: "2013-08-29",
      end_station_name: "Market St", bike_id: 520, subscription_type: "Subscriber",
      zip_code: 94127)
    end

    it "can't save trip without end station name" do
      Trip.create(duration: 63, start_date: "2013-08-29", start_station_id: 4,
      start_station_name: "Embarcadero", end_date: "2013-08-29", end_station_id: 5,
      bike_id: 520, subscription_type: "Subscriber",
      zip_code: 94127)
    end

    it "can't save trip without bike id" do
      Trip.create(duration: 63, start_date: "2013-08-29", start_station_id: 4,
      start_station_name: "Embarcadero", end_date: "2013-08-29", end_station_id: 5,
      end_station_name: "Market St", subscription_type: "Subscriber",
      zip_code: 94127)
    end

    it "can't save trip without Subscription type" do
      Trip.create(duration: 63, start_date: "2013-08-29", start_station_id: 4,
      start_station_name: "Embarcadero", end_date: "2013-08-29", end_station_id: 5,
      end_station_name: "Market St", bike_id: 520, zip_code: 94127)
    end
  end
end
