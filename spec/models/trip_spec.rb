require_relative '../spec_helper'


def format_date(date)
  fd = date.split(/[\/: ]/)
  Time.local(fd[2], fd[0], fd[1], fd[3], fd[4])
end

RSpec.describe Trip do
  describe "validations" do
    it "should be valid with all attributes except zip_code" do
      trip = Trip.create(duration: 39,
                         start_date: format_date("12/15/2013 14:54"),
                         start_station_id: 4,
                         end_date: format_date("12/15/2013 15:56"),
                         bike_id: 6,
                         end_station_id: 32,
                         subscription_type: "Subscriber"
                         )
      expect(trip).to be_valid
    end

    it "should be invalid without duration" do
      trip = Trip.create(start_date: format_date("12/15/2013 14:54"),
                         start_station_id: 4,
                         end_date: format_date("12/15/2013 15:56"),
                         bike_id: 6,
                         end_station_id: 32,
                         subscription_type: "Subscriber"
                         )
      expect(trip).to_not be_valid
    end

    it "should be invalid without start_date" do
      trip = Trip.create(duration: 39,
                         start_station_id: 4,
                         end_date: format_date("12/15/2013 15:56"),
                         bike_id: 6,
                         end_station_id: 32,
                         subscription_type: "Subscriber"
                         )
      expect(trip).to_not be_valid
    end

    xit "should be invalid without start_station_name" do
      trip = Trip.create(duration: 39,
                         start_station_id: 4,
                         start_date: format_date("12/15/2013 14:54"),
                         end_date: format_date("12/15/2013 15:56"),
                         bike_id: 6,
                         end_station_id: 32,
                         subscription_type: "Subscriber"
                         )
      expect(trip).to_not be_valid
    end

    it "should be invalid without end_date" do
      trip = Trip.create(duration: 39,
                         start_station_id: 4,
                         start_date: format_date("12/15/2013 14:54"),
                         bike_id: 6,
                         end_station_id: 32,
                         subscription_type: "Subscriber"
                         )
      expect(trip).to_not be_valid
    end

    it "should be invalid without bike_id" do
      trip = Trip.create(duration: 39,
                         start_date: format_date("12/15/2013 14:54"),
                         start_station_id: 4,
                         end_date: format_date("12/15/2013 15:56"),
                         end_station_id: 32,
                         subscription_type: "Subscriber"
                         )
      expect(trip).to_not be_valid
    end
    xit "should be invalid without end_station_name" do
      trip = Trip.create(duration: 39,
                         start_date: format_date("12/15/2013 14:54"),
                         start_station_id: 4,
                         end_date: format_date("12/15/2013 15:56"),
                         bike_id: 6,
                         end_station_id: 32,
                         subscription_type: "Subscriber"
                         )
      expect(trip).to_not be_valid
    end

    it "should be invalid without subscription_type" do
      trip = Trip.create(duration: 39,
                         start_date: format_date("12/15/2013 14:54"),
                         start_station_id: 4,
                         end_date: format_date("12/15/2013 15:56"),
                         bike_id: 6,
                         end_station_id: 32,
                         )
      expect(trip).to_not be_valid
    end
  end

  describe "calculation methods" do
    it "#average_trip_duration returns 42" do
      trip_1 = Trip.create(duration: 39,
                         start_date: format_date("12/15/2013 14:54"),
                         start_station_id: 4,
                         end_date: format_date("12/15/2013 15:56"),
                         bike_id: 6,
                         end_station_id: 32,
                         subscription_type: "Subscriber"
                         )
      trip_2 = Trip.create(duration: 45,
                        start_date: format_date("11/15/2013 14:54"),
                        start_station_id: 7,
                        end_date: format_date("11/15/2013 15:56"),
                        bike_id: 6,
                        end_station_id: 32,
                        subscription_type: "Subscriber"
                        )

      expect(Trip.average_trip_duration).to eq(42)
    end

    it "#longest_ride returns 45" do
      Trip.create(duration: 39,
                 start_date: format_date("12/15/2013 14:54"),
                 start_station_id: 4,
                 end_date: format_date("12/15/2013 15:56"),
                 bike_id: 6,
                 end_station_id: 32,
                 subscription_type: "Subscriber"
                 )
      Trip.create(duration: 45,
                  start_date: format_date("11/15/2013 14:54"),
                  start_station_id: 7,
                  end_date: format_date("11/15/2013 15:56"),
                  bike_id: 6,
                  end_station_id: 32,
                  subscription_type: "Subscriber"
                  )
      expect(Trip.longest_ride).to eq(45)
    end

    it "#shortest_ride returns 39" do
      Trip.create(duration: 39,
                 start_date: format_date("12/15/2013 14:54"),
                 start_station_id: 4,
                 end_date: format_date("12/15/2013 15:56"),
                 bike_id: 6,
                 end_station_id: 32,
                 subscription_type: "Subscriber"
                 )
      Trip.create(duration: 45,
                  start_date: format_date("11/15/2013 14:54"),
                  start_station_id: 7,
                  end_date: format_date("11/15/2013 15:56"),
                  bike_id: 6,
                  end_station_id: 32,
                  subscription_type: "Subscriber"
                  )
      expect(Trip.shortest_ride).to eq(39)
    end

    it "#most_start_station returns a station name" do
      City.create(name: "Denver")
      Station.create(id: 7, name: "East station", installation_date: 20150331, dock_count: 45, city_id: 1)
      Trip.create(duration: 39,
                 start_date: format_date("12/15/2013 14:54"),
                 start_station_id: 4,
                 end_date: format_date("12/15/2013 15:56"),
                 bike_id: 6,
                 end_station_id: 32,
                 subscription_type: "Subscriber"
                 )
      Trip.create(duration: 45,
                  start_date: format_date("11/15/2013 14:54"),
                  start_station_id: 7,
                  end_date: format_date("11/15/2013 15:56"),
                  bike_id: 6,
                  end_station_id: 32,
                  subscription_type: "Subscriber"
                  )
      Trip.create(duration: 45,
                  start_date: format_date("11/15/2013 14:54"),
                  start_station_id: 7,
                  end_date: format_date("11/15/2013 15:56"),
                  bike_id: 6,
                  end_station_id: 32,
                  subscription_type: "Subscriber"
                  )

      expect(Trip.most_start_station).to eq("East station")
    end
    it "#most_end_station returns a station name" do
      City.create(name: "Denver")
      Station.create(id: 32, name: "South station", installation_date: 20150331, dock_count: 45, city_id: 1)
      Trip.create(duration: 39,
                 start_date: format_date("12/15/2013 14:54"),
                 start_station_id: 4,
                 end_date: format_date("12/15/2013 15:56"),
                 bike_id: 6,
                 end_station_id: 32,
                 subscription_type: "Subscriber"
                 )
      Trip.create(duration: 45,
                  start_date: format_date("11/15/2013 14:54"),
                  start_station_id: 7,
                  end_date: format_date("11/15/2013 15:56"),
                  bike_id: 6,
                  end_station_id: 32,
                  subscription_type: "Subscriber"
                  )
      Trip.create(duration: 45,
                  start_date: format_date("11/15/2013 14:54"),
                  start_station_id: 7,
                  end_date: format_date("11/15/2013 15:56"),
                  bike_id: 6,
                  end_station_id: 7,
                  subscription_type: "Subscriber"
                  )

      expect(Trip.most_end_station).to eq("South station")
    end

    it "#month_breakdown" do
      Trip.create(duration: 39,
                 start_date: format_date("12/15/2013 14:54"),
                 start_station_id: 4,
                 end_date: format_date("12/15/2013 15:56"),
                 bike_id: 6,
                 end_station_id: 32,
                 subscription_type: "Subscriber"
                 )
      Trip.create(duration: 45,
                  start_date: format_date("11/15/2013 14:54"),
                  start_station_id: 7,
                  end_date: format_date("11/15/2013 15:56"),
                  bike_id: 6,
                  end_station_id: 32,
                  subscription_type: "Subscriber"
                  )
      Trip.create(duration: 45,
                  start_date: format_date("11/15/2013 14:54"),
                  start_station_id: 7,
                  end_date: format_date("11/15/2013 15:56"),
                  bike_id: 6,
                  end_station_id: 7,
                  subscription_type: "Subscriber"
                  )

      expect(Trip.month_breakdown).to be_instance_of(String)
    end


  end
end
