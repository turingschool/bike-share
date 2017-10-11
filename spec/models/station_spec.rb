require "spec_helper"

describe Station do

  describe "Validation" do
    it "is invalid without a name" do
      station = Station.new(lat: 37.329732, long: -121.901782, dock_count: 1,
                            city: "Denver",
                            installation_date: Date.new(2015, 12, 8))

      expect(station).to_not be_valid
    end

    it "is invalid without a dock_count" do
      station = Station.new(name: "Luis and 3/4", lat: 37.329732,
                            long: -121.901782, city: "Denver",
                            installation_date: Date.new(2015, 12, 8))

      expect(station).to_not be_valid
    end

    it "is invalid without a city" do
      station = Station.new(name: "Luis and 3/4", lat: 37.329732,
                            long: -121.901782, dock_count: 1,
                            installation_date: Date.new(2015, 12, 8))

      expect(station).to_not be_valid
    end

    it "is invalid without a installation_date" do
      station = Station.new(name: "Luis and 3/4", lat: 37.329732,
                            long: -121.901782, dock_count: 1, city: "Denver")

      expect(station).to_not be_valid
    end

    it "is invalid if name is not unique" do
      Station.create(name: "Luis and 3/4", lat: 37.329732, long: -121.901782,
                     dock_count: 1, city: "Denver",
                     installation_date: Date.new(2015, 12, 8))
      station = Station.create(name: "Luis and 3/4",
                               lat: 37.329732,
                               long: -121.901782,
                               dock_count: 2, city: "Kansas",
                               installation_date: Date.new(2015, 12, 9))

      expect(station).to_not be_valid
    end
  end

  describe "class methods" do

    describe ".count" do
      it "returns total number of stations" do
        Station.create(name: "Station 2", dock_count: 13, city: "Denver",
                       installation_date: Date.new(2015, 12, 8),long: 2.2, lat: 3.3)
        Station.create(name: "Station 1", dock_count: 15, city: "Boston",
                       installation_date: Date.new(2015, 10, 8),long: 2.2, lat: 3.3)

        expect(Station.count).to eq(2)
      end
    end

    describe ".average_bikes_per_stations" do
      it "returns average bikes per station" do
        Station.create(name: "Station 2", dock_count: 13, city: "Denver",
                       installation_date: Date.new(2015, 12, 8), long: 11, lat: 22)
        Station.create(name: "Station 1", dock_count: 15, city: "Boston",
                       installation_date: Date.new(2015, 5, 8), long: 11, lat: 22)

        expect(Station.average_bikes_per_stations).to eq(14)
      end
    end

    describe ".highest_bike_count" do
      it "returns bike count value" do
        Station.create(name: "Station 2", dock_count: 13, city: "Denver",
                        installation_date: Date.new(2015, 12, 8), long: 11, lat: 22)
        Station.create(name: "Station 1", dock_count: 15, city: "Boston",
                       installation_date: Date.new(2015, 12, 8), long: 11, lat: 22)


        expect(Station.highest.first.dock_count).to eq(15)
      end
    end

    describe ".lowest_bike_count" do
      it "returns bike count value" do
        Station.create(name: "Station 2", dock_count: 13, city: "Denver",
                       installation_date: Date.new(2015, 12, 8), long: 11, lat: 22)
        Station.create(name: "Station 1", dock_count: 15, city: "Boston",
                       installation_date: Date.new(2015, 3, 8), long: 11, lat: 22)

        expect(Station.lowest.first.dock_count).to eq(13)
      end
    end

    describe ".newest_station" do
      it "returns the date of the newest station" do
        Station.create(name: "Station 2", dock_count: 13, city: "Denver",
                       installation_date: Date.new(2015, 12, 8), long: 11, lat: 22)
        Station.create(name: "Station 1", dock_count: 15, city: "Boston",
                       installation_date: Date.new(2015, 9, 8), long: 11, lat: 22)

        expect(Station.newest.first.installation_date).to eq(Date.new(2015, 12, 8))
      end
    end

    describe ".oldest_station" do
      it "returns the date of the oldest station" do
        Station.create(name: "Station 2", dock_count: 13, city: "Denver",
                       installation_date: Date.new(2015, 12, 8), long: 11, lat: 22)
        Station.create(name: "Station 1", dock_count: 15, city: "Boston",
                       installation_date: Date.new(2015, 7, 8), long: 11, lat: 22)

        expect(Station.oldest.first.installation_date).to eq(Date.new(2015, 7, 8))
      end
    end
  end

  describe "instance methods" do

    describe "#trips_started" do
      it "returns the number of rides started at a station" do
        station_1 = Station.create!(name: "Station 1", dock_count: 15, city: "Boston",
                      installation_date: Date.new(2015, 7, 8), long: 11, lat: 22)
        station_2 = Station.create!(name: "Station 2", dock_count: 13, city: "Denver",
                       installation_date: Date.new(2015, 12, 8), long: 11, lat: 22)
        Trip.create!(
          duration: 63,
          start_date: DateTime.new(2013,8,28,14,14),
          start_station_name: "Station 1",
          start_station_id: 1,
          end_date: DateTime.new(2013,8,29,14,14),
          end_station_name: "Station 2",
          end_station_id: 2,
          bike_id: 520,
          subscription_type: "Subscriber",
          zip_code: 94127
        )
        Trip.create!(
         duration: 161,
         start_date: DateTime.new(2013,8,28,14,14),
         start_station_name: "Station 2",
         start_station_id: 2,
         end_date: DateTime.new(2013,8,29,14,14),
         end_station_name: "Station 1",
         end_station_id: 1,
         bike_id: 521,
         subscription_type: "Customer",
         zip_code: 95234
        )

        expect(station_1.trips_started).to eq(1)
        expect(station_2.trips_started).to eq(1)
      end
    end

    describe "#trips_ended" do
      it "returns the number of rides ended at a station" do
        station_1 = Station.create!(name: "Station 1", dock_count: 15, city: "Boston",
                      installation_date: Date.new(2015, 7, 8), long: 11, lat: 22)
        station_2 = Station.create!(name: "Station 2", dock_count: 13, city: "Denver",
                       installation_date: Date.new(2015, 12, 8), long: 11, lat: 22)
        Trip.create!(
          duration: 63,
          start_date: DateTime.new(2013,8,28,14,14),
          start_station_name: "Station 1",
          start_station_id: 1,
          end_date: DateTime.new(2013,8,29,14,14),
          end_station_name: "Station 2",
          end_station_id: 2,
          bike_id: 520,
          subscription_type: "Subscriber",
          zip_code: 94127
        )
        Trip.create!(
         duration: 161,
         start_date: DateTime.new(2013,8,28,14,14),
         start_station_name: "Station 2",
         start_station_id: 2,
         end_date: DateTime.new(2013,8,29,14,14),
         end_station_name: "Station 1",
         end_station_id: 1,
         bike_id: 521,
         subscription_type: "Customer",
         zip_code: 95234
        )

        expect(station_1.trips_ended).to eq(1)
        expect(station_2.trips_ended).to eq(1)
      end
    end

    describe "#highest_end_station_count" do
      it "returns the most frequent destination station" do
        station_1 = Station.create!(name: "Station 1", dock_count: 15, city: "Boston",
                      installation_date: Date.new(2015, 7, 8), long: 11, lat: 22)
        station_2 = Station.create!(name: "Station 2", dock_count: 13, city: "Denver",
                       installation_date: Date.new(2015, 12, 8), long: 11, lat: 22)
        Trip.create!(
          duration: 63,
          start_date: DateTime.new(2013,8,28,14,14),
          start_station_name: "Station 1",
          start_station_id: 1,
          end_date: DateTime.new(2013,8,29,14,14),
          end_station_name: "Station 2",
          end_station_id: 2,
          bike_id: 520,
          subscription_type: "Subscriber",
          zip_code: 94127
        )
        Trip.create!(
         duration: 161,
         start_date: DateTime.new(2013,8,28,14,14),
         start_station_name: "Station 2",
         start_station_id: 2,
         end_date: DateTime.new(2013,8,29,14,14),
         end_station_name: "Station 1",
         end_station_id: 1,
         bike_id: 521,
         subscription_type: "Customer",
         zip_code: 95234
        )

        expect(station_1.highest_end_station_count).to eq("Station 2")
        expect(station_2.highest_end_station_count).to eq("Station 1")
      end
    end

    describe "#highest_origin_station_count" do
      it "returns the most frequent origin station" do
        station_1 = Station.create!(name: "Station 1", dock_count: 15, city: "Boston",
                      installation_date: Date.new(2015, 7, 8), long: 11, lat: 22)
        station_2 = Station.create!(name: "Station 2", dock_count: 13, city: "Denver",
                       installation_date: Date.new(2015, 12, 8), long: 11, lat: 22)
        Trip.create!(
          duration: 63,
          start_date: DateTime.new(2013,8,28,14,14),
          start_station_name: "Station 1",
          start_station_id: 1,
          end_date: DateTime.new(2013,8,29,14,14),
          end_station_name: "Station 2",
          end_station_id: 2,
          bike_id: 520,
          subscription_type: "Subscriber",
          zip_code: 94127
        )
        Trip.create!(
         duration: 161,
         start_date: DateTime.new(2013,8,28,14,14),
         start_station_name: "Station 2",
         start_station_id: 2,
         end_date: DateTime.new(2013,8,29,14,14),
         end_station_name: "Station 1",
         end_station_id: 1,
         bike_id: 521,
         subscription_type: "Customer",
         zip_code: 95234
        )

        expect(station_1.highest_origin_station_count).to eq("Station 2")
        expect(station_2.highest_origin_station_count).to eq("Station 1")
      end
    end

    describe "#most_popular_date" do
      it "returns the date with the highest number of trips started at this station" do
        station_1 = Station.create!(name: "Station 1", dock_count: 15, city: "Boston",
                      installation_date: Date.new(2015, 7, 8), long: 11, lat: 22)
        station_2 = Station.create!(name: "Station 2", dock_count: 13, city: "Denver",
                       installation_date: Date.new(2015, 12, 8), long: 11, lat: 22)
        Trip.create!(
          duration: 63,
          start_date: DateTime.new(2013,8,28,14,14),
          start_station_name: "Station 1",
          start_station_id: 1,
          end_date: DateTime.new(2013,8,29,14,14),
          end_station_name: "Station 2",
          end_station_id: 2,
          bike_id: 520,
          subscription_type: "Subscriber",
          zip_code: 94127
        )
        Trip.create!(
         duration: 161,
         start_date: DateTime.new(2013,8,28,14,14),
         start_station_name: "Station 2",
         start_station_id: 2,
         end_date: DateTime.new(2013,8,29,14,14),
         end_station_name: "Station 1",
         end_station_id: 1,
         bike_id: 521,
         subscription_type: "Customer",
         zip_code: 95234
        )

        expect(station_1.most_popular_date).to eq(Date.new(2013,8,28))
        expect(station_2.most_popular_date).to eq(Date.new(2013,8,28))
      end
    end

    describe "#most_frequent_zip_code" do
      it "returns the most frequent zip code for users starting trips at this station" do
        station_1 = Station.create!(name: "Station 1", dock_count: 15, city: "Boston",
                      installation_date: Date.new(2015, 7, 8), long: 11, lat: 22)
        station_2 = Station.create!(name: "Station 2", dock_count: 13, city: "Denver",
                       installation_date: Date.new(2015, 12, 8), long: 11, lat: 22)
        Trip.create!(
          duration: 63,
          start_date: DateTime.new(2013,8,28,14,14),
          start_station_name: "Station 1",
          start_station_id: 1,
          end_date: DateTime.new(2013,8,29,14,14),
          end_station_name: "Station 2",
          end_station_id: 2,
          bike_id: 520,
          subscription_type: "Subscriber",
          zip_code: 94127
        )
        Trip.create!(
         duration: 161,
         start_date: DateTime.new(2013,8,28,14,14),
         start_station_name: "Station 2",
         start_station_id: 2,
         end_date: DateTime.new(2013,8,29,14,14),
         end_station_name: "Station 1",
         end_station_id: 1,
         bike_id: 521,
         subscription_type: "Customer",
         zip_code: 95234
        )

        expect(station_1.most_frequent_zip_code).to eq(94127)
        expect(station_2.most_frequent_zip_code).to eq(95234)
      end
    end

    describe "#most_popular_bike_id" do
      it "returns the bike ID most frequently starting a trip at this station" do
        station_1 = Station.create!(name: "Station 1", dock_count: 15, city: "Boston",
                      installation_date: Date.new(2015, 7, 8), long: 11, lat: 22)
        station_2 = Station.create!(name: "Station 2", dock_count: 13, city: "Denver",
                       installation_date: Date.new(2015, 12, 8), long: 11, lat: 22)
        Trip.create!(
          duration: 63,
          start_date: DateTime.new(2013,8,28,14,14),
          start_station_name: "Station 1",
          start_station_id: 1,
          end_date: DateTime.new(2013,8,29,14,14),
          end_station_name: "Station 2",
          end_station_id: 2,
          bike_id: 520,
          subscription_type: "Subscriber",
          zip_code: 94127
        )
        Trip.create!(
         duration: 161,
         start_date: DateTime.new(2013,8,28,14,14),
         start_station_name: "Station 2",
         start_station_id: 2,
         end_date: DateTime.new(2013,8,29,14,14),
         end_station_name: "Station 1",
         end_station_id: 1,
         bike_id: 521,
         subscription_type: "Customer",
         zip_code: 95234
        )

        expect(station_1.most_popular_bike_id).to eq(520)
        expect(station_2.most_popular_bike_id).to eq(521)
      end
    end
  end
end
