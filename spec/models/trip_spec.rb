describe Trip do

  describe "validations" do
    it "has to have all data fields present" do
      trip = Trip.create(
        duration: 60,
        start_station: 54,
        end_station: 66,
        bike_id: 66,
        subscription_type_id: 1,
        trip_date: Date.strptime("5/5/2015", "%m/%d/%Y")
      )

      invalid_trip = Trip.new(
        duration: 5,
        start_station: 5
      )

      expect(trip).to be_valid
      expect(invalid_trip).to_not be_valid
    end
  end

  describe "class methods" do
      before(:each) do
        SubscriptionType.create(subscription_type: 'Subscriber')
        SubscriptionType.create(subscription_type: 'Customer')

        Station.create(
          name: "Brandon's Station",
          dock_count: 13,
          city_id: 1,
          installation_date: "8/5/2013"
        )

        Station.create(
          name: "Fancy Mike's Station",
          dock_count: 13,
          city_id: 1,
          installation_date: "8/5/2013"
        )

        Trip.create(
          duration: 60,
          start_station: 2,
          end_station: 1,
          bike_id: 66,
          subscription_type_id: SubscriptionType.find(2).id,
          trip_date: Date.strptime("5/5/2015", "%m/%d/%Y"),
                    zip_code: ZipCode.find_or_create_by(zip_code: 94107)
        )

        Trip.create(
          duration: 80,
          start_station: 1,
          end_station: 2,
          bike_id: 67,
          subscription_type_id: SubscriptionType.find(1).id,
          trip_date: Date.strptime("6/5/2014", "%m/%d/%Y"),
          zip_code: ZipCode.find_or_create_by(zip_code: 94207)
        )

        Trip.create(
          duration: 80,
          start_station: 1,
          end_station: 2,
          bike_id: 66,
          subscription_type_id: SubscriptionType.find(2).id,
          trip_date: Date.strptime("5/5/2015", "%m/%d/%Y"),
          zip_code: ZipCode.find_or_create_by(zip_code: 94107)
        )
      end

      it "returns the average durrration" do
        average_duration = Trip.average_duration
        expect(average_duration).to eq(1)
      end


      it "returns the single longest ride" do
        expect(Trip.longest).to eq(1)
      end

      it "returns shortest ride" do
        expect(Trip.shortest).to eq(1)
      end

      it "finds the station with the most trips starting from it" do
        expect(Trip.station_with_most_starts).to eq("Brandon's Station")
      end

      it "finds the station with the most trips ending at it" do
        expect(Trip.station_with_most_ends).to eq("Fancy Mike's Station")
      end

      it "finds the most ridden bike with the total number of rides for that bike"  do
        expect(Trip.bike_with_most_rides).to eq([66, 2])
      end

      it "find the least ridden bike with the total number of rides" do
        expect(Trip.bike_with_least_rides).to eq([67, 1])
      end

      it "finds the month by month breakdown of total rides with a total by year" do
        expect(Trip.trip_count_by_month.keys.first.month).to eq(5)
        expect(Trip.trip_count_by_year.keys.first.year).to eq(2015)
        expect(Trip.trip_count_by_month.values.first).to eq(2)
        expect(Trip.trip_count_by_year.values.first).to eq(2)
      end

      it "returns the count of subscribers and customers" do
        expect(Trip.subscriber_count).to eq([1, 2])
      end

      it "returns percentage of subscribers and customers" do
        expect(Trip.subscriber_percentage).to eq(["33%", "67%"])
      end
      it "returns a single date with the highest number of trips and a count" do
        expect(Trip.most_trips_by_date).to eq(["2015-05-05", 2])
      end
      it "returns a single date with the lowest number of trips and a count" do
        expect(Trip.fewest_trips_by_date).to eq(["2014-06-05", 1])
      end
      it "returns a count by date by zip code" do
        count_1 = Trip.find_by_date("5/5/2015")
        count_2 = Trip.find_by_date("6/5/2014", 94207)

        expect(count_1).to eq(2)
        expect(count_2).to eq(1)
      end
    end
  end
