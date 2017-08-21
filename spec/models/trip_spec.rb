RSpec.describe Trip do
  describe "Class Methods" do
    describe ".per_page" do
      xit 'returns certain number of trips per page' do

      end
    end

    describe ".avg_duration_of_a_ride" do
      it 'returns average duration of a trip' do
        Trip.create(duration: 100,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "2nd at South Park",
                    end_date: "2013-08-29 09:11:00",
                    end_station_name: "10th at South Park",
                    bike_id: 288,
                    subscription_type: "Subscriber",
                    zip_code: "94114")

        Trip.create(duration: 200,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "2nd at South Park",
                    end_date: "2013-08-29 09:11:00",
                    end_station_name: "Hello Kitty",
                    bike_id: 288,
                    subscription_type: "Subscriber",
                    zip_code: "94114")
        expect(Trip.avg_duration_of_a_ride).to eq(150)
      end
    end

    describe ".longest_ride" do
      it 'returns the longest trip' do
        Trip.create(duration: 100,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "2nd at South Park",
                    end_date: "2013-08-29 09:11:00",
                    end_station_name: "10th at South Park",
                    bike_id: 288,
                    subscription_type: "Subscriber",
                    zip_code: "94114")

        Trip.create(duration: 200,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "2nd at South Park",
                    end_date: "2013-08-29 09:11:00",
                    end_station_name: "Hello Kitty",
                    bike_id: 288,
                    subscription_type: "Subscriber",
                    zip_code: "94114")
        expect(Trip.longest_ride).to eq(200)
      end
    end

    describe ".shortest_ride" do
      it 'returns the shortest trip' do
        Trip.create(duration: 100,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "2nd at South Park",
                    end_date: "2013-08-29 09:11:00",
                    end_station_name: "10th at South Park",
                    bike_id: 288,
                    subscription_type: "Subscriber",
                    zip_code: "94114")

        Trip.create(duration: 200,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "2nd at South Park",
                    end_date: "2013-08-29 09:11:00",
                    end_station_name: "Hello Kitty",
                    bike_id: 288,
                    subscription_type: "Subscriber",
                    zip_code: "94114")
        expect(Trip.shortest_ride).to eq(100)
      end
    end

    describe ".station_with_most_ride_starts" do
      it 'returns the station name with the most ride starts' do
        Station.create(name: "Panera", dock_count: 15, city: "Denver", installation_date: "2014-04-09")
        Station.create(name: "Turing", dock_count: 10, city: "Denver", installation_date: "2014-04-09")
        Station.create(name: "King Sooper", dock_count: 10, city: "Denver", installation_date: "2014-04-09")
        Station.create(name: "Trader Joes", dock_count: 10, city: "Denver", installation_date: "2014-04-09")

        Trip.create(duration: 174,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "Panera",
                    end_date: "2013-08-29 09:11:00",
                    end_station_name: "Turing",
                    bike_id: 288,
                    start_station_id: 1,
                    end_station_id: 2,
                    subscription_type: "Subscriber",
                    zip_code: "94114")

        Trip.create(duration: 174,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "Turing",
                    end_date: "2013-08-29 09:11:00",
                    end_station_name: "King Sooper",
                    bike_id: 288,
                    start_station_id: 2,
                    end_station_id: 3,
                    subscription_type: "Subscriber",
                    zip_code: "94114")

        Trip.create(duration: 174,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "Trader Joes",
                    end_date: "2013-08-29 09:11:00",
                    end_station_name: "Turing",
                    bike_id: 288,
                    start_station_id: 4,
                    end_station_id: 4,
                    subscription_type: "Subscriber",
                    zip_code: "94114")

        Trip.create(duration: 174,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "Panera",
                    end_date: "2013-08-29 09:11:00",
                    end_station_name: "Turing",
                    bike_id: 288,
                    start_station_id: 1,
                    end_station_id: 1,
                    subscription_type: "Subscriber",
                    zip_code: "94114")

        Trip.create(duration: 174,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "Turing",
                    end_date: "2013-08-29 09:11:00",
                    end_station_name: "Turing",
                    bike_id: 288,
                    start_station_id: 2,
                    end_station_id: 2,
                    subscription_type: "Subscriber",
                    zip_code: "94114")

        Trip.create(duration: 174,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "Panera",
                    end_date: "2013-08-29 09:11:00",
                    end_station_name: "Panera",
                    bike_id: 288,
                    start_station_id: 1,
                    end_station_id: 1,
                    subscription_type: "Subscriber",
                    zip_code: "94114")
        expect(Trip.station_with_most_ride_starts).to eq("Panera")
      end
    end

    describe ".station_with_most_rides_ends" do
      it 'returns station name with the most ended rides' do
        Station.create(name: "Panera", dock_count: 15, city: "Denver", installation_date: "2014-04-09")
        Station.create(name: "Turing", dock_count: 10, city: "Denver", installation_date: "2014-04-09")
        Station.create(name: "King Sooper", dock_count: 10, city: "Denver", installation_date: "2014-04-09")
        Station.create(name: "Trader Joes", dock_count: 10, city: "Denver", installation_date: "2014-04-09")

        Trip.create(duration: 174,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "Panera",
                    end_date: "2013-08-29 09:11:00",
                    end_station_name: "Turing",
                    bike_id: 288,
                    start_station_id: 1,
                    end_station_id: 2,
                    subscription_type: "Subscriber",
                    zip_code: "94114")

        Trip.create(duration: 174,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "Turing",
                    end_date: "2013-08-29 09:11:00",
                    end_station_name: "King Sooper",
                    bike_id: 288,
                    start_station_id: 2,
                    end_station_id: 3,
                    subscription_type: "Subscriber",
                    zip_code: "94114")

        Trip.create(duration: 174,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "Trader Joes",
                    end_date: "2013-08-29 09:11:00",
                    end_station_name: "Turing",
                    bike_id: 288,
                    start_station_id: 4,
                    end_station_id: 4,
                    subscription_type: "Subscriber",
                    zip_code: "94114")

        Trip.create(duration: 174,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "Panera",
                    end_date: "2013-08-29 09:11:00",
                    end_station_name: "Turing",
                    bike_id: 288,
                    start_station_id: 1,
                    end_station_id: 1,
                    subscription_type: "Subscriber",
                    zip_code: "94114")

        Trip.create(duration: 174,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "Turing",
                    end_date: "2013-08-29 09:11:00",
                    end_station_name: "Turing",
                    bike_id: 288,
                    start_station_id: 2,
                    end_station_id: 2,
                    subscription_type: "Subscriber",
                    zip_code: "94114")

        Trip.create(duration: 174,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "Panera",
                    end_date: "2013-08-29 09:11:00",
                    end_station_name: "Panera",
                    bike_id: 288,
                    start_station_id: 1,
                    end_station_id: 1,
                    subscription_type: "Subscriber",
                    zip_code: "94114")

        expect(Trip.station_with_most_rides_ends).to eq("Panera")
      end
    end

    describe ".month_breakdown" do
      it 'returns month by month breakdown with year subtotals' do
        Station.create(name: "Panera", dock_count: 15, city: "Denver", installation_date: "2014-04-09")
        Station.create(name: "Turing", dock_count: 10, city: "Denver", installation_date: "2014-04-09")
        Station.create(name: "King Sooper", dock_count: 10, city: "Denver", installation_date: "2014-04-09")
        Station.create(name: "Trader Joes", dock_count: 10, city: "Denver", installation_date: "2014-04-09")

        Trip.create(duration: 174,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "Panera",
                    end_date: "2013-07-29 09:11:00",
                    end_station_name: "Turing",
                    bike_id: 288,
                    start_station_id: 1,
                    end_station_id: 2,
                    subscription_type: "Subscriber",
                    zip_code: "94114")

        Trip.create(duration: 174,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "Turing",
                    end_date: "2013-08-29 09:11:00",
                    end_station_name: "King Sooper",
                    bike_id: 288,
                    start_station_id: 2,
                    end_station_id: 3,
                    subscription_type: "Subscriber",
                    zip_code: "94114")

        Trip.create(duration: 174,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "Trader Joes",
                    end_date: "2013-08-29 09:11:00",
                    end_station_name: "Turing",
                    bike_id: 288,
                    start_station_id: 4,
                    end_station_id: 4,
                    subscription_type: "Subscriber",
                    zip_code: "94114")

        Trip.create(duration: 174,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "Panera",
                    end_date: "2013-08-29 09:11:00",
                    end_station_name: "Turing",
                    bike_id: 288,
                    start_station_id: 1,
                    end_station_id: 1,
                    subscription_type: "Subscriber",
                    zip_code: "94114")

        Trip.create(duration: 174,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "Turing",
                    end_date: "2013-06-29 09:11:00",
                    end_station_name: "Turing",
                    bike_id: 288,
                    start_station_id: 2,
                    end_station_id: 2,
                    subscription_type: "Subscriber",
                    zip_code: "94114")

        Trip.create(duration: 174,
                    start_date: "2013-08-29 09:08:00",
                    start_station_name: "Panera",
                    end_date: "2013-07-29 09:11:00",
                    end_station_name: "Panera",
                    bike_id: 288,
                    start_station_id: 1,
                    end_station_id: 1,
                    subscription_type: "Subscriber",
                    zip_code: "94114")
        expect(Trip.month_breakdown).to eq({[2013, 8]=>3, [2013, 7]=>2, [2013, 6]=>1})
      end
    end

    describe ".most_ridden_bike" do
      it 'returns the bike id that occurs most frequently' do

      end
    end

    describe ".least_ridden_bike" do
      it 'returns the bike id that occurs least frequently' do

      end
    end

    describe ".subscription_info" do
      it 'returns user subscription type breakdown count' do

      end
    end

    describe ".subscription_percentage" do
      it 'returns user subscription type by percentage' do

      end
    end

    describe ".date_with_highest_trips" do
      it 'returns single date with highest number of trips with a count' do

      end
    end

    describe ".date_with_fewest_trips" do
      it 'returns single date with fewest number of trips with a count' do

      end
    end

    describe ".number_of_starting_rides_at_station" do
      it 'returns total count of rides starting  at this station' do

      end
    end

    describe ".number_of_ending_rides_at_station" do
      it 'returns total count of rides ending at this station'

    end

    describe ".most_frequent_destination" do
      it 'returns most frequent destination for rides the begin at this station' do

      end
    end

    describe ".most_frequent_origination" do
      it 'returns most frequent origin for rides that ended at this station' do

      end
    end

    describe ".date_with_highest_trip_from_this_station" do
      it 'returns date with the highest number of trips started at this station' do

      end
    end

    describe ".most_frequent_zip_code_users_starting" do
      it 'returns most frequent zip code for users starting trips at this station' do

      end
    end

    describe ".most_frequent_bike_starting" do
      it 'returns most frequent bike id starting at this station' do

      end
    end

    describe "Validations" do
      context "Trip" do
        it 'is invalid without a duration' do

        end

        it 'is invalid without a start date' do

        end

        it 'is invalid without an end date' do

        end

        it 'is invalid without a start station id' do

        end

        it 'is invalid without an end station id' do

        end

        it 'is invalid without a bike id' do

        end

        it 'is invalid without a subsciption id' do

        end

      end
    end
  end
end
