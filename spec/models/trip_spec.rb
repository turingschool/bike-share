RSpec.describe Trip do
  describe "Validations" do
    it "is invalid without a duration" do
      trip = Trip.new(start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "customer", zipcode_id: 7)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start_date_id" do
      trip = Trip.new(duration: 1, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "customer", zipcode_id: 7)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start_station_id" do
      trip = Trip.new(duration: 1, start_date_id: 2, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "customer", zipcode_id: 7)

      expect(trip).to_not be_valid
    end

    it "is invalid without an end_date_id" do
      trip = Trip.new(duration: 1, start_date_id: 2, start_station_id: 3, end_station_id: 5, bike_id: 6, subscription_type: "customer", zipcode_id: 7)

      expect(trip).to_not be_valid
    end

    it "is invalid without an end_station_id" do
      trip = Trip.new(duration: 1, start_date_id: 2, start_station_id: 3, end_date_id: 4, bike_id: 6, subscription_type: "customer", zipcode_id: 7)

      expect(trip).to_not be_valid
    end

    it "is invalid without a bike_id" do
      trip = Trip.new(duration: 1, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, subscription_type: "customer", zipcode_id: 7)

      expect(trip).to_not be_valid
    end

    it "is invalid without a subscription_type" do
      trip = Trip.new(duration: 1, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, zipcode_id: 7)

      expect(trip).to_not be_valid
    end

    it "is invalid without a zipcode_id" do
      trip = Trip.new(duration: 1, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "customer")

      expect(trip).to_not be_valid
    end
  end

  describe "Class Methods" do
    describe '.date_with_most_trips' do
      it "returns single date with highest number of trips and count of those trips" do
        date = BikeShareDate.create(date: Date.strptime('1/1/2012', '%m/%d/%Y'))
        date_2 = BikeShareDate.create(date: Date.strptime('2/5/2017', '%m/%d/%Y'))


        Trip.create(duration: 111, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 1)
        Trip.create(duration: 222, start_date_id: 1, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "User", zipcode_id: 2)
        Trip.create(duration: 333, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 444, start_date_id: 1, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "User", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)

        result = Trip.date_with_most_trips

        expect(result.class).to eq(Hash)
        expect(result[:date]).to eq(date_2)
        expect(result[:count]).to eq(3)
      end
    end

    describe ".date_with_least_trips" do
      it "returns single date with lowest number of trips and count of those trips" do
        date = BikeShareDate.create(date: Date.strptime('1/1/2012', '%m/%d/%Y'))
        date_2 = BikeShareDate.create(date: Date.strptime('2/5/2017', '%m/%d/%Y'))#


        Trip.create(duration: 111, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 1)
        Trip.create(duration: 222, start_date_id: 1, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "User", zipcode_id: 2)
        Trip.create(duration: 333, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 444, start_date_id: 1, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "User", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)

        result = Trip.date_with_least_trips

        expect(result.class).to eq(Hash)
        expect(result[:date]).to eq(date)
        expect(result[:count]).to eq(2)
      end
    end

    describe ".bike_with_most_rides" do
      it "returns a bike id and number of trips for that bike" do
        Trip.create(duration: 111, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 1)
        Trip.create(duration: 222, start_date_id: 1, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "User", zipcode_id: 2)
        Trip.create(duration: 333, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 1, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 444, start_date_id: 1, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 1, subscription_type: "User", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 2, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 2, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 2, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 3, subscription_type: "Customer", zipcode_id: 2)

        result = Trip.bike_with_most_rides

        expect(result[:bike]).to eq(6)
        expect(result[:count]).to eq(5)
      end
    end

    describe ".bike_with_least_rides" do
      it "returns a bike id and number of trips for that bike" do
        Trip.create(duration: 111, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 1)
        Trip.create(duration: 222, start_date_id: 1, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "User", zipcode_id: 2)
        Trip.create(duration: 333, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 1, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 444, start_date_id: 1, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 1, subscription_type: "User", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 2, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 2, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 2, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 3, subscription_type: "Customer", zipcode_id: 2)

        result = Trip.bike_with_least_rides

        expect(result[:bike]).to eq(3)
        expect(result[:count]).to eq(1)
      end
    end

    describe ".group_by_month" do
      it "returns a hash with totals grouped by month and year" do
        date = BikeShareDate.create(date: Date.strptime('1/1/2013', '%m/%d/%Y'))
        date_2 = BikeShareDate.create(date: Date.strptime('2/5/2014', '%m/%d/%Y'))
        date_3 = BikeShareDate.create(date: Date.strptime('3/5/2014', '%m/%d/%Y'))
        date_4 = BikeShareDate.create(date: Date.strptime('2/17/2014', '%m/%d/%Y'))
        date_5 = BikeShareDate.create(date: Date.strptime('2/5/2015', '%m/%d/%Y'))

        Trip.create(duration: 111, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 1)
        Trip.create(duration: 222, start_date_id: 1, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "User", zipcode_id: 2)
        Trip.create(duration: 333, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 1, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 444, start_date_id: 1, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 1, subscription_type: "User", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 2, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 3, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 2, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 4, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 2, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 5, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 3, subscription_type: "Customer", zipcode_id: 2)

        years = {2013 => {}, 2014 => {}, 2015 => {}}
        result = Trip.group_by_month(years)

        expect(result[2014]['February']).to eq(7)
        expect(result[2014]['March']).to eq(1)
        expect(result[2015]['February']).to eq(1)
      end
    end

    describe '.total_by_year' do
      it "adds the year's total to the years hash" do
        years = {2013 => {"November"=>100, "December"=>30, "October"=>70},
                 2014 => {"November"=>33, "December"=>15, "October"=>72},
                 2015 => {"November"=>50, "December"=>30, "October"=>25}}

        result = Trip.total_by_year(years)

        expect(result[2013]['total']).to eq(200)
        expect(result[2014]['total']).to eq(120)
        expect(result[2015]['total']).to eq(105)
      end
    end

    describe ".rides_by_month" do
      it "returns a hash with totals by month and subtotals by year" do
        date = BikeShareDate.create(date: Date.strptime('1/1/2013', '%m/%d/%Y'))
        date_2 = BikeShareDate.create(date: Date.strptime('2/5/2014', '%m/%d/%Y'))
        date_3 = BikeShareDate.create(date: Date.strptime('3/5/2014', '%m/%d/%Y'))
        date_4 = BikeShareDate.create(date: Date.strptime('2/17/2014', '%m/%d/%Y'))
        date_5 = BikeShareDate.create(date: Date.strptime('2/5/2015', '%m/%d/%Y'))

        Trip.create(duration: 111, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 1)
        Trip.create(duration: 222, start_date_id: 1, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "User", zipcode_id: 2)
        Trip.create(duration: 333, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 1, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 444, start_date_id: 1, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 1, subscription_type: "User", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 2, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 3, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 2, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 4, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 2, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 5, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 3, subscription_type: "Customer", zipcode_id: 2)

        result = Trip.rides_by_month

        expect(result[2014]['February']).to eq(7)
        expect(result[2014]['March']).to eq(1)
        expect(result[2015]['February']).to eq(1)
        expect(result[2014]['total']).to eq (8)
      end
    end
  end
end
