RSpec.describe Station do
  context "Validations" do
    it "is invalid without name" do
      station = Station.create(dock_count: 20, city: "San Francisco", installation_date: "2013-08-06")

      expect(station).to be_invalid
    end

    it "is invalid without dock count" do
      station = Station.create(name: "Embarcadero", city: "San Francisco", installation_date: "2013-08-06")

      expect(station).to be_invalid
    end

    it "is invalid without city" do
      station = Station.create(name: "Embarcadero", dock_count: 20, installation_date: "2013-08-13")

      expect(station).to be_invalid
    end

    it "is invalid without installation date" do
      station = Station.create(name: "Embacadero", dock_count: 20, city: "San Francisco" )

      expect(station).to be_invalid
    end
  end

  context "Class Methods" do
    before :each do
      @station_1 = Station.create(name: "SF", dock_count: 5,
      city: "San Francisco", installation_date: "2013-08-23")
      @station_2 = Station.create(name: "CO", dock_count: 4, city: "Denver", installation_date: "2013-08-14")
      @station_3 = Station.create(name: "WI", dock_count: 3, city: "Madison", installation_date: "2013-08-06")
      @station_4 = Station.create(name: "The Bay", dock_count: 25, city: "San Francisco", installation_date: "2013-08-14")
    end

    describe '.station_count' do
      it "returns total station count" do
        expect(Station.station_count).to eq(4)
      end
    end

    describe '.average_bikes_per_station' do #rounded to 9?
      it "gives average bikes per station" do
        expect(Station.average_bikes_per_station).to eq(9)
      end
    end

    describe '.max_bikes_per_station' do
      it "gives max bikes perstation" do
        expect(Station.max_bikes_per_station).to eq(25)
      end
    end

    describe '.station_with_most_bikes_available' do
      it "gives station with most bikes available" do
        expect(Station.station_with_most_bikes_available).to eq("The Bay")
      end
    end

    describe '.min_bikes_at_station' do
      it "gives station with minimum bikes" do
        expect(Station.min_bikes_at_station).to eq(3)
      end
    end

    describe '.station_with_fewest_available' do
      it "gives station with fewest available bikes" do
        expect(Station.station_with_fewest_available).to eq("WI")
      end
    end

    describe '.most_recent_station' do
      it "gives most recently installed station" do
        expect(Station.most_recent_station).to eq("SF")
      end
    end

    describe ".oldest_station" do
      it "gives oldest station" do
        expect(Station.oldest_station).to eq("WI")
      end
    end

    context "@station Methods for Station Show Page", :foo => true do
      before :each do
        @station = Station.find(9)
      end


      describe ".number_rides_at_start_station" do
        it "gives number of rides started at a specific station" do
          expect(@station.number_rides_at_start_station).to eq(2)
        end
      end

      describe ".number_rides_at_end_station" do
        it "gives number of rides ended at a specific station" do
          expect(@station.number_rides_at_end_station).to eq(2)
        end
      end

      describe ".most_frequent_destination_station" do
        it "gives most frequent destination station for rides that began at this station" do
          expect(@station.most_frequent_destination_station).to eq("Japantown")
        end
      end

      describe ".most_frequent_origination_station" do
        it "gives most frequent origination station for rides that end at this station" do
          expect(@station.most_frequent_origination_station).to eq("Japantown")
        end
      end

      describe ".date_with_highest_number_trips_started" do
        it "gives the date with the highest number of trips started at a particular station" do
          expect(@station.date_with_highest_number_trips_started).to eq("2014-09-01")
        end
      end

      describe ".most_frequent_user_zipcode" do
        it "gives most frequent zipcode for users starting trips at a specific station" do
          expect(@station.most_frequent_user_zipcode).to eq(95112)
        end
      end

      describe ".most_frequent_bike_id" do
        it "gives most frequent bike id starting trips at a specific station" do
          expect(@station.most_frequent_bike_id).to eq(56)
        end
      end

    end
  end
end
