RSpec.context Trip do
  describe 'Class Methods' do
    before do
      ['SF', 'Santa Cruz', 'Ocean Beach'].each { |city| City.create(name: city) }
      sf, santa_cruz, ocean_beach = City.find(1), City.find(2), City.find(3)

      Trip.create(duration: 20,
                  start_date: "11-3-2014 14:44",
                  start_station_id: 222,
                  end_station_id: 2233,
                  end_date: "10-2-2015 14:55",
                  bike_id: 12,
                  subscription_type: "Subscriber",
                  zip_code: 1029)
      Trip.create(duration: 35,
                  start_date: "11-3-2014 10:10",
                  start_station_id: 2,
                  end_station_id: 4,
                  end_date: "11-3-2014 14:55",
                  bike_id: 2,
                  subscription_type: "Customer",
                  zip_code: 33156)
    end

    describe '.average_duration' do
      it 'returns average trip duration' do
        expect(Trip.average_duration).to eql(27.5)
      end
    end

    describe '.longest_ride' do
      it 'returns the longest ride' do
        expect(Trip.longest_ride).to eql(35)
      end
    end

    describe '.shortest_ride' do
      it 'returns the shortest ride' do
        expect(Trip.shortest_ride).to eql(20)
      end
    end
  end

  describe "Validates" do
    it 'creates a trip given necessary parameters' do
     cool = Trip.create(duration: 211,
                        start_date: "11-3-2014 10:10",
                        start_station_id: 2,
                        end_station_id: 4,
                        end_date: "11-3-2014 14:55",
                        bike_id: 2,
                        subscription_type: "Customer",
                        zip_code: 33156)

      expect(cool).to be_valid
    end

    it 'existence of duration' do
     cool = Trip.create(start_date: "11-3-2014 10:10",
                        start_station_id: 2,
                        end_station_id: 4,
                        end_date: "11-3-2014 14:55",
                        bike_id: 2,
                        subscription_type: "Customer",
                        zip_code: 33156)

      expect(cool).to_not be_valid
    end

    it "presence of start date" do
      cool = Trip.create(duration: 211,
                         start_station_id: 2,
                         end_station_id: 4,
                         end_date: "11-3-2014 14:55",
                         bike_id: 2,
                         subscription_type: "Customer",
                         zip_code: 33156)

      expect(cool).to_not be_valid
    end

    it "presence of start station id" do
      cool = Trip.create(duration: 211,
                         start_date: "11-3-2014 10:10",
                         end_station_id: 4,
                         end_date: "11-3-2014 14:55",
                         bike_id: 2,
                         subscription_type: "Customer",
                         zip_code: 33156)

      expect(cool).to_not be_valid
    end

    it 'existence of end station id' do
     cool = Trip.create(duration: 211,
                        start_date: "11-3-2014 10:10",
                        start_station_id: 2,
                        end_date: "11-3-2014 14:55",
                        bike_id: 2,
                        subscription_type: "Customer",
                        zip_code: 33156)

      expect(cool).to_not be_valid
    end

    it 'existence of end date' do
     cool = Trip.create(duration: 211,
                        start_date: "11-3-2014 10:10",
                        start_station_id: 2,
                        end_station_id: 4,
                        bike_id: 2,
                        subscription_type: "Customer",
                        zip_code: 33156)

      expect(cool).to_not be_valid
    end

    it 'existence of bike id' do
     cool = Trip.create(duration: 211,
                        start_date: "11-3-2014 10:10",
                        start_station_id: 2,
                        end_station_id: 4,
                        end_date: "11-3-2014 14:55",
                        subscription_type: "Customer",
                        zip_code: 33156)

      expect(cool).to_not be_valid
    end

    it 'existence of subscription type' do
     cool = Trip.create(duration: 211,
                        start_date: "11-3-2014 10:10",
                        start_station_id: 2,
                        end_station_id: 4,
                        end_date: "11-3-2014 14:55",
                        bike_id: 2,
                        zip_code: 33156)

      expect(cool).to_not be_valid
    end

    it 'existence of zip code' do
     cool = Trip.create(duration: 211,
                        start_date: "11-3-2014 10:10",
                        start_station_id: 2,
                        end_station_id: 4,
                        end_date: "11-3-2014 14:55",
                        bike_id: 2,
                        subscription_type: "Customer")

      expect(cool).to_not be_valid
    end
  end
end