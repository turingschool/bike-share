require 'spec_helper'

RSpec.describe Station do
  describe "validations" do
    it "is invalid without a name" do
      station = Station.create(dock_count: 40, city: "San Francisco", installation_date: 8/6/2013)

      expect(station).to be_invalid
    end

    it "is invalid without a dock count" do
      station = Station.new(name: "Japantown", city: "San Francisco", installation_date: 8/6/2013)

      expect(station).to be_invalid
    end

    it "is invalid without a city" do
      station = Station.new(name: "Japantown", dock_count: 40, installation_date: 8/6/2013)

      expect(station).to be_invalid
    end

    it "is invalid without an installation_date" do
      station = Station.new(name: "Japantown", dock_count: 40, city: "San Francisco")

      expect(station).to be_invalid
    end

    it "is valid with all the requisite information" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect(Station.all.count).to eql(3)
    end
  end

  describe "class methods" do
    it "can find average bikes" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect(Station.average_bikes_per_station).to eql(18)
    end

    it "can find most bikes" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect(Station.most_bikes).to eql(27)
    end

    it "can find station with most bikes" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect(Station.with_most_bikes.first.name).to eql("San Jose Diridon Caltrain Station")
    end

    it "can find fewest bikes" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect(Station.fewest_bikes).to eql(13)
    end

    it "can find station with fewest bikes" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect(Station.with_fewest_bikes.first.name).to eql("MLK Library")
    end

    it "can find newest install date" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect((Station.newest_install_date).strftime("%d/%m/%Y")).to eql("12/08/2013")
    end

    it "can find newest station" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect(Station.newest_station.first.name).to eql("Clay at Battery")
    end

    it "can find oldest install date" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect((Station.oldest_install_date).strftime("%d/%m/%Y")).to eql("01/08/2013")
    end

    it "can find oldest station" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect(Station.oldest_station.first.name).to eql("San Jose Diridon Caltrain Station")
    end

    # it "can find the most frequent destination by station" do
    #   Trip.create(duration: 40, start_date: "14/9/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)
    #   Trip.create(duration: 109, start_date: "28/8/2013 13:25", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 13:27", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Subscriber", zip_code: 95112)
    #   Trip.create(duration: 138, start_date: "29/8/2013 16:57", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 16:59", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Customer", zip_code: 94117)
    #
    #   expect(Trip.most_frequent_destination("Golden Gate at Polk")).to eql("Adobe on Almaden")
    #  end

    # it "can find the most frequent origination by station" do
    #   Trip.create(duration: 40, start_date: "14/9/2013 18:54", start_station_name: "Post at Kearney", end_date: "29/8/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)
    #   Trip.create(duration: 109, start_date: "28/8/2013 13:25", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 13:27", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Subscriber", zip_code: 95112)
    #   Trip.create(duration: 138, start_date: "29/8/2013 16:57", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 16:59", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Customer", zip_code: 94117)
    #
    #   expect(Trip.most_frequent_origination_station("Adobe on Almaden")).to eql("Golden Gate at Polk")
    # end
    #
    # it "can find the number of trips started by station" do
    #   Trip.create(duration: 40, start_date: "14/9/2013 18:54", start_station_name: "Post at Kearney", end_date: "29/8/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)
    #   Trip.create(duration: 109, start_date: "28/8/2013 13:25", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 13:27", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Subscriber", zip_code: 95112)
    #   Trip.create(duration: 138, start_date: "29/8/2013 16:57", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 16:59", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Customer", zip_code: 94117)
    #
    #   expect(Trip.number_trips_started_at_station("Post at Kearney")).to eql(1)
    #   expect(Trip.number_trips_started_at_station("Golden Gate at Polk")).to eql(2)
    # end
    #
    # it "can find the number of trips ended by station" do
    #   Trip.create(duration: 40, start_date: "14/9/2013 18:54", start_station_name: "Post at Kearney", end_date: "29/8/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)
    #   Trip.create(duration: 109, start_date: "28/8/2013 13:25", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 13:27", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Subscriber", zip_code: 95112)
    #   Trip.create(duration: 138, start_date: "29/8/2013 16:57", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 16:59", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Customer", zip_code: 94117)
    #
    #   expect(Trip.number_trips_ended_at_station("Adobe on Almaden")).to eql(2)
    #   expect(Trip.number_trips_ended_at_station("Golden Gate at Polk")).to eql(1)
    # end
    #
    # it "can find the date with the highest trips by station" do
    #   Trip.create(duration: 40, start_date: "14/9/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)
    #   Trip.create(duration: 109, start_date: "28/8/2013 13:25", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 13:27", end_station_name: "Post at Kearney", bike_id: 679, subscription: "Subscriber", zip_code: 95112)
    #   Trip.create(duration: 138, start_date: "28/8/2013 16:57", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 16:59", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Customer", zip_code: 94117)
    #
    #   expect(Trip.date_with_highest_trips_by_station("Golden Gate at Polk").strftime("%m/%d/%Y")).to eql("08/28/2013")
    # end
    #
    # it "can find the most frequent user zipcode" do
    #   Trip.create(duration: 40, start_date: "14/9/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)
    #   Trip.create(duration: 109, start_date: "28/8/2013 13:25", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 13:27", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Subscriber", zip_code: 95112)
    #   Trip.create(duration: 138, start_date: "29/8/2013 16:57", start_station_name: "Golden Gate at Polk", end_date: "29/8/2013 16:59", end_station_name: "Post at Kearney", bike_id: 679, subscription: "Customer", zip_code: 94109)
    #
    #   expect(Trip.most_frequent_user_zipcodes("Golden Gate at Polk")).to eql(94109)
    # end
    #
    # it "can find the most frequent user zipcode" do
    #   Trip.create(duration: 40, start_date: "14/9/2013 18:54", start_station_name: "Post at Kearney", end_date: "29/8/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)
    #   Trip.create(duration: 109, start_date: "28/8/2013 13:25", start_station_name: "Post at Kearney", end_date: "29/8/2013 13:27", end_station_name: "Adobe on Almaden", bike_id: 679, subscription: "Subscriber", zip_code: 95112)
    #   Trip.create(duration: 138, start_date: "29/8/2013 16:57", start_station_name: "Post at Kearney", end_date: "29/8/2013 16:59", end_station_name: "Post at Kearney", bike_id: 679, subscription: "Customer", zip_code: 94109)
    #
    #   expect(Trip.most_frequent_bike_used("Post at Kearney")).to eql(679)
    # end
  end

end
