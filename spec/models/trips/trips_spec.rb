require 'Date'

RSpec.describe Trip do
	describe "Validations" do
		it "can exist with valid attributes" do
      trip = Trip.create(duration: 4002, start_date: "1969/4/20", end_date: "1969/4/21",
												 start_station_id: 1, end_station_id: 2, bike_id: 4,
			 									 subscription_type: "Some Nonsense", zip_code: "80113"          )

      expect(trip.duration).to eq(4002)
      expect(trip.start_date).to eq(Date.parse("1969/4/20"))
      expect(trip.end_date).to eq(Date.parse("1969/4/21"))
      expect(trip.start_station_id).to eq(1)
			expect(trip.end_station_id).to eq(2)
			expect(trip.bike_id).to eq(4)
			expect(trip.subscription_type).to eq("Some Nonsense")
			expect(trip.zip_code).to eq("80113")


			expect(Trip.count).to eq(1)
		end
	end

	describe "In-Validations" do
		it "Is invalid without a duration" do
			trip = Trip.create(start_date: "1969/4/20", end_date: "1969/4/21",
												 start_station_id: 1, end_station_id: 2, bike_id: 4,
												 subscription_type: "Some Nonsense", zip_code: "80113"          )
			expect(Trip.count).to eq(0)
		end

		it "Is invalid without a start date" do
			trip = Trip.create(duration: 4002, end_date: "1969/4/21",
												 start_station_id: 1, end_station_id: 2, bike_id: 4,
												 subscription_type: "Some Nonsense", zip_code: "80113"          )

			expect(Trip.count).to eq(0)
		end

		it "Is invalid without a end date" do
			trip = Trip.create(duration: 4002, start_date: "1969/4/20",
												 start_station_id: 1, end_station_id: 2, bike_id: 4,
												 subscription_type: "Some Nonsense", zip_code: "80113"          )

			expect(Trip.count).to eq(0)
		end

		it "Is invalid without a start station id" do
			trip = Trip.create(duration: 4002, start_date: "1969/4/20", end_date: "1969/4/21" ,
			 										end_station_id: 2, bike_id: 4, subscription_type: "Some Nonsense",
													zip_code: "80113")

			expect(Trip.count).to eq(0)
		end

		it "Is invalid without a end station id" do
			trip = Trip.create(duration: 4002, start_date: "1969/4/20", end_date: "1969/4/21",
												 start_station_id: 1, bike_id: 4,
												 subscription_type: "Some Nonsense", zip_code: "80113"          )

			expect(Trip.count).to eq(0)
		end

		it "Is invalid without a bike id" do
			trip = Trip.create(duration: 4002, start_date: "1969/4/20", end_date: "1969/4/21",
												 start_station_id: 1, end_station_id: 2,
												 subscription_type: "Some Nonsense", zip_code: "80113"          )

			expect(Trip.count).to eq(0)
		end

		it "Is invalid without a subscription type" do
			trip = Trip.create(duration: 4002, start_date: "1969/4/20", end_date: "1969/4/21",
												 start_station_id: 1, end_station_id: 2, bike_id: 4, zip_code: "80113")

			expect(Trip.count).to eq(0)
		end
	end

	describe "Class Methods" do
		it "Gets the average duration of a ride" do
			trip_1 = Trip.create(duration: 60, start_date: "1969/4/20", end_date: "1969/4/21",
												 start_station_id: 1, end_station_id: 2, bike_id: 4,
			 									 subscription_type: "Some Nonsense", zip_code: "80113")

			trip_2 = Trip.create(duration: 120, start_date: "1969/4/20", end_date: "1969/4/21",
												 start_station_id: 1, end_station_id: 2, bike_id: 4,
			 									 subscription_type: "Some Nonsense", zip_code: "80113")


			trip_3 = Trip.create(duration: 180, start_date: "1969/4/20", end_date: "1969/4/21",
												 start_station_id: 1, end_station_id: 2, bike_id: 4,
			 									 subscription_type: "Some Nonsense", zip_code: "80113")


			avg_trip_duration = Trip.average_duration_of_a_trip

			expect(avg_trip_duration).to eq("02:00")
		end

		it "Gets the longest ride" do
			trip_1 = Trip.create(duration: 660, start_date: "1969/4/20", end_date: "1969/4/21",
												 start_station_id: 1, end_station_id: 2, bike_id: 4,
			 									 subscription_type: "Some Nonsense", zip_code: "80113")

			trip_2 = Trip.create(duration: 1200, start_date: "1969/4/20", end_date: "1969/4/21",
												 start_station_id: 1, end_station_id: 2, bike_id: 4,
			 									 subscription_type: "Some Nonsense", zip_code: "80113")


			trip_3 = Trip.create(duration: 180000, start_date: "1969/4/20", end_date: "1969/4/21",
												 start_station_id: 1, end_station_id: 2, bike_id: 4,
			 									 subscription_type: "Some Nonsense", zip_code: "80113")


			expect(Trip.longest_ride).to eq("2 days")
		end


	end
end
