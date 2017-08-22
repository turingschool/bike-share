describe Trip do
  describe "validations" do
    it "has to have all data fields present" do
      trip = Trip.create(
        duration: 60,
        start_station: 54,
        end_station: 66,
        bike_id: 66,
        subscription_type_id: 10,
        start_date_id: 6,
        end_date_id: 5,
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

    describe "find average durrration" do
      it "returns the average durrration" do
      30.times do
        trip = Trip.create(
        duration: 60,
        start_station: 54,
        end_station: 66,
        bike_id: 66,
        subscription_type_id: 10,
        start_date_id: 6,
        end_date_id: 5,
      )
      trip = Trip.create(
      duration: 80,
      start_station: 54,
      end_station: 66,
      bike_id: 66,
      subscription_type_id: 10,
      start_date_id: 6,
      end_date_id: 5,
    )
      end
      average_duration = Trip.average_duration
      expect(average_duration).to eq(70)
    end
  end

  describe "find longest duration" do
    it "returns the single longest ride" do
      trip = Trip.create(
      duration: 60,
      start_station: 54,
      end_station: 66,
      bike_id: 66,
      subscription_type_id: 10,
      start_date_id: 6,
      end_date_id: 5,
    )
    trip = Trip.create(
    duration: 80,
    start_station: 54,
    end_station: 66,
    bike_id: 66,
    subscription_type_id: 10,
    start_date_id: 6,
    end_date_id: 5,
  )
    expect(Trip.longest).to eq(80)
        end
      end


  it "returns shortest ride" do
    trip = Trip.create(
    duration: 60,
    start_station: 54,
    end_station: 66,
    bike_id: 66,
    subscription_type_id: 10,
    start_date_id: 6,
    end_date_id: 5,
  )
    trip = Trip.create(
    duration: 80,
    start_station: 54,
    end_station: 66,
    bike_id: 66,
    subscription_type_id: 10,
    start_date_id: 6,
    end_date_id: 5,
    )
    expect(Trip.shortest).to eq(60)
  end

  it "finds the station with the most trips starting from it" do
    trip = Trip.create(
    duration: 60,
    start_station: 23,
    end_station: 66,
    bike_id: 66,
    subscription_type_id: 10,
    start_date_id: 6,
    end_date_id: 5,
  )
  trip = Trip.create(
  duration: 80,
  start_station: 54,
  end_station: 66,
  bike_id: 66,
  subscription_type_id: 10,
  start_date_id: 6,
  end_date_id: 5,
  )
  trip = Trip.create(
  duration: 80,
  start_station: 54,
  end_station: 66,
  bike_id: 66,
  subscription_type_id: 10,
  start_date_id: 6,
  end_date_id: 5,
  )

  expect(Trip.station_with_most_starts).to eq(54)

  end


    end
  end
