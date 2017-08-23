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
      subscription_type_id: SubscriptionType.find(2),
      trip_date: Date.strptime("5/5/2015", "%m/%d/%Y")
      )
    Trip.create(
    duration: 80,
    start_station: 1,
    end_station: 2,
    bike_id: 67,
    subscription_type_id: SubscriptionType.find(1),
    trip_date: Date.strptime("6/5/2015", "%m/%d/%Y")
    )

    Trip.create(
    duration: 80,
    start_station: 1,
    end_station: 2,
    bike_id: 66,
    subscription_type_id: SubscriptionType.find(2),
    trip_date: Date.strptime("5/5/2015", "%m/%d/%Y"),
    )
    end

    it "returns the average durrration" do
      average_duration = Trip.average_duration
      expect(average_duration).to eq(73.33)
    end


    it "returns the single longest ride" do
      expect(Trip.longest).to eq(80)
    end

    it "returns shortest ride" do
      expect(Trip.shortest).to eq(60)
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

    it "returns the count of subscribers and customers" do
      expect(Trip.subscriber_count).to eq([2, 1])
    end



    end
  end

  # it "returns percentage of subscribers and customers" do
  #   expect(Trip.subscriber_percentage).to eq([0.66, 0.33])
  # end

# it "finds the month by month breakdown of total rides with a total by year" do    expect(Trip.trip_count_by_month).to eq(2)
#   expect(Trip.trip_count_by_year).to eq(3)
#   end
