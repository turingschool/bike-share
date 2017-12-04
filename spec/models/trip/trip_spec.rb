homeRSpec.describe Trip do
  context "Validations" do
    it "can't save trip without duration" do
      trip = Trip.create(start_date: "2013-08-29", start_station_id: 4,
      start_station_name: "Embarcadero", end_date: "2013-08-29", end_station_id: 5,
      end_station_name: "Market St", bike_id: 520, subscription_type: "Subscriber",
      zip_code: 94127)

      expect(trip).to be_invalid
    end

    it "can't save trip without Start Date" do
      trip = Trip.create(duration: 63, start_station_id: 4,
      start_station_name: "Embarcadero", end_date: "2013-08-29", end_station_id: 5,
      end_station_name: "Market St", bike_id: 520, subscription_type: "Subscriber",
      zip_code: 94127)

      expect(trip).to be_invalid
    end

    it "can't save trip without Start Station id" do
      trip = Trip.create(duration: 63, start_date: "2013-08-29",
      start_station_name: "Embarcadero", end_date: "2013-08-29", end_station_id: 5,
      end_station_name: "Market St", bike_id: 520, subscription_type: "Subscriber",
      zip_code: 94127)

      expect(trip).to be_invalid
    end

    it "can't save trip without Start Station name" do
      trip = Trip.create(duration: 63, start_date: "2013-08-29", start_station_id: 4,
      end_date: "2013-08-29", end_station_id: 5,
      end_station_name: "Market St", bike_id: 520, subscription_type: "Subscriber",
      zip_code: 94127)

      expect(trip).to be_invalid
    end

    it "can't save trip without end date" do
      trip = Trip.create(duration: 63, start_date: "2013-08-29", start_station_id: 4,
      start_station_name: "Embarcadero", end_station_id: 5,
      end_station_name: "Market St", bike_id: 520, subscription_type: "Subscriber",
      zip_code: 94127)

      expect(trip).to be_invalid
    end

    it "can't save trip without end station id" do
      trip = Trip.create(duration: 63, start_date: "2013-08-29", start_station_id: 4,
      start_station_name: "Embarcadero", end_date: "2013-08-29",
      end_station_name: "Market St", bike_id: 520, subscription_type: "Subscriber",
      zip_code: 94127)

      expect(trip).to be_invalid
    end

    it "can't save trip without end station name" do
      trip = Trip.create(duration: 63, start_date: "2013-08-29", start_station_id: 4,
      start_station_name: "Embarcadero", end_date: "2013-08-29", end_station_id: 5,
      bike_id: 520, subscription_type: "Subscriber",
      zip_code: 94127)

      expect(trip).to be_invalid
    end

    it "can't save trip without bike id" do
      trip = Trip.create(duration: 63, start_date: "2013-08-29", start_station_id: 4,
      start_station_name: "Embarcadero", end_date: "2013-08-29", end_station_id: 5,
      end_station_name: "Market St", subscription_type: "Subscriber",
      zip_code: 94127)

      expect(trip).to be_invalid
    end

    it "can't save trip without Subscription type" do
      trip = Trip.create(duration: 63, start_date: "2013-08-29", start_station_id: 4,
      start_station_name: "Embarcadero", end_date: "2013-08-29", end_station_id: 5,
      end_station_name: "Market St", bike_id: 520, zip_code: 94127)

      expect(trip).to be_invalid
    end
  end

  context "Class Methods" do
    before :each do
      @station_1 = Station.create(name: "SF", dock_count: 5,
      city: "San Francisco", installation_date: "2013-08-23")
      @station_2 = Station.create(name: "CO", dock_count: 4, city: "Denver",
      installation_date: "2013-08-14")
      @station_3 = Station.create(name: "WI", dock_count: 3, city: "Madison",
      installation_date: "2013-08-06")
      @station_4 = Station.create(name: "The Bay", dock_count: 25,
        city: "San Francisco", installation_date: "2013-08-14")


      @trip_1 = Trip.create(duration: 63, start_date: "2013-08-29", start_station_id: 1,
      start_station_name: "Embarcadero", end_date: "2013-08-30", end_station_id: 2,
      end_station_name: "Market St", bike_id: 520, subscription_type: "Subscriber",
      zip_code: 94127)
      @trip_2 = Trip.create(duration: 53, start_date: "2013-02-27", start_station_id: 2,
      start_station_name: "SFO", end_date: "2013-02-27", end_station_id: 1,
      end_station_name: "Mission District", bike_id: 510, subscription_type: "Customer",
      zip_code: 94105)
      @trip_3 = Trip.create(duration: 43, start_date: "2014-08-18", start_station_id: 2,
      start_station_name: "Turing", end_date: "2014-08-18", end_station_id: 4,
      end_station_name: "Union Station", bike_id: 510, subscription_type: "Subscriber",
      zip_code: 94128)
      @trip_4 = Trip.create(duration: 33, start_date: "2014-06-22", start_station_id: 3,
      start_station_name: "Capitol Hill", end_date: "2014-06-22", end_station_id: 4,
      end_station_name: "Red Rocks", bike_id: 550, subscription_type: "Subscriber",
      zip_code: 94101)
    end

    context "Trip Methods for Trip Dashboard Page" do
      describe ".average_duration_per_ride" do
        it "gives you average duration of a ride" do
          expect(Trip.average_duration_per_ride).to eq(48)
        end
      end

      describe ".longest_ride" do
        it "gives you longest ride" do
          expect(Trip.longest_ride).to eq(63)
        end
      end

      describe ".shortest_ride" do
        it "gives you shortest ride" do
          expect(Trip.shortest_ride).to eq(33)
        end
      end

      describe ".start_station_with_most_rides" do
        it "gives you the start station with the most rides" do
          expect(Trip.start_station_with_most_rides).to eq("CO")
        end
      end

      describe ".end_station_with_most_rides" do
        it "gives you the end station with the most rides" do
          expect(Trip.end_station_with_most_rides).to eq("The Bay")
        end
      end

      describe ".month_by_month" do
        it "gives you the month by month breakdown of number of rides with subtotals for each year" do
          expect(Trip.month_by_month.class).to eql(Hash)
          expect(Trip.month_by_month).to have_value(1)
        end
      end

      describe ".year_by_year" do
        it "gives you the year by year breakdown of number of rides with subtotals for each year" do
          expect(Trip.year_by_year.class).to eql(Hash)
          expect(Trip.year_by_year).to have_value(2)
        end
      end

      describe ".most_ridden_bike" do
        it "gives most ridden bike with total number of rides for that bike" do
          expect(Trip.most_ridden_bike.class).to eql(Array)
          expect(Trip.most_ridden_bike).to eq([510,2])
        end
      end

      describe ".least_ridden_bike" do
        it "gives least ridden bike with total number of rides for that bike" do
          expect(Trip.least_ridden_bike.class).to eql(Array)
          expect(Trip.least_ridden_bike).to eq([550,1])
        end
      end

      describe ".user_subscription_type_count" do
        it "user subscription type breakout with count" do
          expect(Trip.user_subscription_type_count.class).to eql(Hash)
          expect(Trip.user_subscription_type_count).to have_value(3)
        end
      end

      describe ".user_subscription_type_percentage" do
        it "user subscription type breakout with percentage" do
          expect(Trip.user_subscription_type_percentage.class).to eql(Hash)
          expect(Trip.user_subscription_type_percentage).to have_value(75.0)
        end
      end

      describe ".single_date_with_highest" do
        it "single date with highest number of trips with count of those trips" do
          expect(Trip.single_date_with_highest.class).to eql(Array)
          expect(Trip.single_date_with_highest).to eq(["2013-02-27", 1])
        end
      end

      describe ".single_date_with_lowest" do
        it "single date with lowest number of trips with count of those trips" do
          expect(Trip.single_date_with_lowest.class).to eql(Array)
          expect(Trip.single_date_with_lowest).to eq(["2013-02-27", 1])
        end
      end
    end

    context "Trip Methods for Station Show Page" do
      describe ".number_rides_at_start_station" do
        it "gives number of rides started at a specific station" do
          expect(Trip.number_rides_at_start_station(@station_1.id)).to eq(1)
        end
      end

      describe ".number_rides_at_end_station" do
        it "gives number of rides ended at a specific station" do
          expect(Trip.number_rides_at_end_station(@station_1.id)).to eq(1)
        end
      end

      describe ".most_frequent_destination_station" do
        it "gives most frequent destination station for rides that began at this station" do
          expect(Trip.most_frequent_destination_station(@station_2.id)).to eq("The Bay")
        end
      end

      describe ".most_frequent_origination_station" do
        it "gives most frequent origination station for rides that end at this station" do
          expect(Trip.most_frequent_origination_station(@station_4.id)).to eq("WI")
        end
      end

      describe ".date_with_highest_number_trips_started" do
        it "gives the date with the highest number of trips started at a particular station" do
          expect(Trip.date_with_highest_number_trips_started(@station_2.id)).to eq("2014-08-18")
        end
      end

      describe ".most_frequent_user_zipcode" do
        it "gives most frequent zipcode for users starting trips at a specific station" do
          expect(Trip.most_frequent_user_zipcode.class).to eql(Hash)
          expect(Trip.most_frequent_user_zipcode).to have_value(1)
        end
      end

      describe ".most_frequent_bike_id" do
        it "gives most frequent bike id starting trips at a specific station" do
          expect(Trip.most_frequent_bike_id.class).to eql(Hash)
          expect(Trip.most_frequent_bike_id).to have_value(1)
        end
      end
    end
  end
end
