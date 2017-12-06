RSpec.describe Trip do
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

  context "Class Methods", :foo => true do
    context "Trip Methods for Trip Dashboard Page" do
      describe ".average_duration_per_ride" do
        it "gives you average duration of a ride" do
          expect(Trip.average_duration_per_ride).to eq(745)
        end
      end

      describe ".longest_ride" do
        it "gives you longest ride" do
          expect(Trip.longest_ride).to eq(17396)
        end
      end

      describe ".shortest_ride" do
        it "gives you shortest ride" do
          expect(Trip.shortest_ride).to eq(63)
        end
      end

      describe ".start_station_with_most_rides" do
        it "gives you the start station with the most rides" do
          expect(Trip.start_station_with_most_rides).to eq("South Van Ness at Market")
        end
      end

      describe ".end_station_with_most_rides" do
        it "gives you the end station with the most rides" do
          expect(Trip.end_station_with_most_rides).to eq("Steuart at Market")
        end
      end

      describe ".month_by_month" do
        it "gives you the month by month breakdown of number of rides with subtotals for each year" do
          expect(Trip.month_by_month.class).to eql(Hash)
          expect(Trip.month_by_month).to have_value(26)
        end
      end

      describe ".year_by_year" do
        it "gives you the year by year breakdown of number of rides with subtotals for each year" do
          expect(Trip.year_by_year.class).to eql(Hash)
          expect(Trip.year_by_year).to have_value(62)
        end
      end

      describe ".most_ridden_bike" do
        it "gives most ridden bike with total number of rides for that bike" do
          expect(Trip.most_ridden_bike.class).to eql(Array)
          expect(Trip.most_ridden_bike).to eq([461, 3])
        end
      end

      describe ".least_ridden_bike" do
        it "gives least ridden bike with total number of rides for that bike" do
          expect(Trip.least_ridden_bike.class).to eql(Array)
          expect(Trip.least_ridden_bike).to eq([12, 1])
        end
      end

      describe ".subscription_breakdown" do
        it "user subscription type breakout with count" do
          expect(Trip.subscription_breakdown.class).to eql(Hash)
          expect(Trip.subscription_breakdown).to have_value(24)
        end
      end

      describe '.customer_subscription_percentage' do
        it "customer subscription type breakout with percentage" do
          expect(Trip.customer_subscription_percentage.round(1)).to eq(12.1)
        end
      end

      describe '.subscriber_subscription_percentage' do
        it "subscriber subscription type breakout with percentage" do
          expect(Trip.subscriber_subscription_percentage.round(1)).to eq(87.9)
        end
      end


      describe ".single_date_with_highest" do
        it "single date with highest number of trips with count of those trips" do
          expect(Trip.single_date_with_highest.class).to eql(Array)
          expect(Trip.single_date_with_highest).to eq(["2013-11-26 00:00:00 UTC", 36])
        end
      end

      describe ".single_date_with_lowest" do
        it "single date with lowest number of trips with count of those trips" do
          expect(Trip.single_date_with_lowest.class).to eql(Array)
          expect(Trip.single_date_with_lowest).to eq(["2014-10-24 00:00:00.000000000 +0000", 9])
        end
      end
    end

    context "Trip Methods for Station Show Page" do
      describe ".number_rides_at_start_station" do
        it "gives number of rides started at a specific station" do
          expect(Trip.number_rides_at_start_station(2)).to eq(3)
        end
      end

      describe ".number_rides_at_end_station" do
        it "gives number of rides ended at a specific station" do
          expect(Trip.number_rides_at_end_station(2)).to eq(3)
        end
      end

      describe ".most_frequent_destination_station" do
        it "gives most frequent destination station for rides that began at this station" do
          expect(Trip.most_frequent_destination_station(2)).to eq("Santa Clara at Almaden")
        end
      end

      describe ".most_frequent_origination_station" do
        it "gives most frequent origination station for rides that end at this station" do
          expect(Trip.most_frequent_origination_station(5)).to eq("San Jose City Hall")
        end
      end

      describe ".date_with_highest_number_trips_started" do
        it "gives the date with the highest number of trips started at a particular station" do
          expect(Trip.date_with_highest_number_trips_started(2)).to eq("2015-06-22")
        end
      end

      describe ".most_frequent_user_zipcode" do
        it "gives most frequent zipcode for users starting trips at a specific station" do
          expect(Trip.most_frequent_user_zipcode(2)).to eq(94043)
        end
      end

      describe ".most_frequent_bike_id" do
        it "gives most frequent bike id starting trips at a specific station" do
          expect(Trip.most_frequent_bike_id(2)).to eq(671)
        end
      end
    end
  end
end
