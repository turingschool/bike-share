require "spec_helper"

describe Condition do
  describe "Validation" do
    it "is invalid without a date" do
      condtion = Condition.new(
      max_temperature_f: 70,
      min_temperature_f: 40,
      mean_temperature_f: 60,
      mean_humidity: 30,
      mean_visibility_miles: 10,
      mean_wind_speed_mph: 4 ,
      precipitation_inches: 1,
      zip_code: 95234)

      expect(condtion).to_not be_valid
    end

    it "is invalid without a unique date" do
      Condition.create(
      date: Date.new(2013,8,28),
      max_temperature_f: 70,
      min_temperature_f: 40,
      mean_temperature_f: 60,
      mean_humidity: 30,
      mean_visibility_miles: 10,
      mean_wind_speed_mph: 4 ,
      precipitation_inches: 1,
      zip_code: 95234)

      condtion = Condition.create(
      date: Date.new(2013,8,28),
      max_temperature_f: 72,
      min_temperature_f: 42,
      mean_temperature_f: 64,
      mean_humidity: 38,
      mean_visibility_miles: 1,
      mean_wind_speed_mph: 3,
      precipitation_inches: 2,
      zip_code: 95233)

      expect(condtion).to_not be_valid
    end

    it "is invalid without a max temperature" do
      condtion = Condition.new(
      date: Date.new(2013,8,28),
      min_temperature_f: 40,
      mean_temperature_f: 60,
      mean_humidity: 30,
      mean_visibility_miles: 10,
      mean_wind_speed_mph: 4 ,
      precipitation_inches: 1,
      zip_code: 95234)

      expect(condtion).to_not be_valid
    end

    it "is invalid without a min temperature" do
      condtion = Condition.new(
      date: Date.new(2013,8,28),
      max_temperature_f: 40,
      mean_temperature_f: 60,
      mean_humidity: 30,
      mean_visibility_miles: 10,
      mean_wind_speed_mph: 4 ,
      precipitation_inches: 1,
      zip_code: 95234)

      expect(condtion).to_not be_valid
    end

    it "is invalid without a mean temperature" do
      condtion = Condition.new(
      date: Date.new(2013,8,28),
      max_temperature_f: 40,
      min_temperature_f: 60,
      mean_humidity: 30,
      mean_visibility_miles: 10,
      mean_wind_speed_mph: 4 ,
      precipitation_inches: 1,
      zip_code: 95234)

      expect(condtion).to_not be_valid
    end

    it "is invalid without a mean humidity" do
      condtion = Condition.new(
      date: Date.new(2013,8,28),
      max_temperature_f: 40,
      min_temperature_f: 60,
      mean_temperature_f: 30,
      mean_visibility_miles: 10,
      mean_wind_speed_mph: 4 ,
      precipitation_inches: 1,
      zip_code: 95234)

      expect(condtion).to_not be_valid
    end

    it "is invalid without a mean visibility" do
      condtion = Condition.new(
      date: Date.new(2013,8,28),
      max_temperature_f: 40,
      min_temperature_f: 60,
      mean_temperature_f: 30,
      mean_humidity: 10,
      mean_wind_speed_mph: 4 ,
      precipitation_inches: 1,
      zip_code: 95234)

      expect(condtion).to_not be_valid
    end

    it "is invalid without a mean wind speed" do
      condtion = Condition.new(
      date: Date.new(2013,8,28),
      max_temperature_f: 40,
      min_temperature_f: 60,
      mean_temperature_f: 30,
      mean_humidity: 10,
      mean_visibility_miles: 4 ,
      precipitation_inches: 1,
      zip_code: 95234)

      expect(condtion).to_not be_valid
    end

    it "is invalid without a precipitation" do
      condtion = Condition.new(
      date: Date.new(2013,8,28),
      max_temperature_f: 40,
      min_temperature_f: 60,
      mean_temperature_f: 30,
      mean_humidity: 10,
      mean_visibility_miles: 4 ,
      mean_wind_speed_mph: 1,
      zip_code: 95234)

      expect(condtion).to_not be_valid
    end

    it "is invalid without a zip code" do
      condtion = Condition.new(
      date: Date.new(2013,8,28),
      max_temperature_f: 40,
      min_temperature_f: 60,
      mean_temperature_f: 30,
      mean_humidity: 10,
      mean_visibility_miles: 4 ,
      mean_wind_speed_mph: 1,
      precipitation_inches: 4)

      expect(condtion).to_not be_valid
    end
  end

describe "class_methods" do
  describe ".trips_with_max_temperature" do
    it "returns collection of conditions between temperatures associated with trips" do
      Trip.create!(
        duration: 633456,
        start_date: DateTime.new(2014,8,23,14,13),
        start_station_name: "Van Ness at Market",
        start_station_id: 66,
        end_date: DateTime.new(2014,8,23,17,17),
        end_station_name: "Van Ness at Market",
        end_station_id: 66,
        bike_id: 400,
        zip_code: 94127,
        subscription_type: "Subscriber")

      Trip.create!(
        duration: 644456,
        start_date: DateTime.new(2014,8,23,14,13),
        start_station_name: "Van Ness at Market",
        start_station_id: 40,
        end_date: DateTime.new(2014,8,23,17,17),
        end_station_name: "Van Ness at Market",
        end_station_id: 40,
        bike_id: 400,
        zip_code: 94127,
        subscription_type: "Subscriber")

      Condition.create!(
        date: Date.new(2014,8,23),
        max_temperature_f: 40,
        min_temperature_f: 30,
        mean_temperature_f: 35,
        mean_humidity: 10,
        mean_visibility_miles: 4 ,
        mean_wind_speed_mph: 1,
        precipitation_inches: 4,
        zip_code: 94127)

        expect(Condition.trips_with_max_temperature(30, 50).count).to eq(2)
      end
    end

    describe ".average_trips_with_max_temperature" do
      it "returns average trips between temperatures" do
        Trip.create!(
          duration: 633456,
          start_date: DateTime.new(2014,8,23,14,13),
          start_station_name: "Van Ness at Market",
          start_station_id: 66,
          end_date: DateTime.new(2014,8,23,17,17),
          end_station_name: "Van Ness at Market",
          end_station_id: 66,
          bike_id: 400,
          zip_code: 94127,
          subscription_type: "Subscriber")

        Trip.create!(
          duration: 644456,
          start_date: DateTime.new(2014,8,23,14,13),
          start_station_name: "Van Ness at Market",
          start_station_id: 40,
          end_date: DateTime.new(2014,8,23,17,17),
          end_station_name: "Van Ness at Market",
          end_station_id: 40,
          bike_id: 400,
          zip_code: 94127,
          subscription_type: "Subscriber")

        Condition.create!(
          date: Date.new(2014,8,23),
          max_temperature_f: 40,
          min_temperature_f: 30,
          mean_temperature_f: 35,
          mean_humidity: 10,
          mean_visibility_miles: 4 ,
          mean_wind_speed_mph: 1,
          precipitation_inches: 4,
          zip_code: 94127)

          expect(Condition.average_trips_with_max_temperature(30, 50)).to eq(2)
        end
      end

    describe ".average_trips_with_average_max_temperature" do
      it "returns average of average trips between temperatures" do
        Trip.create!(
          duration: 633456,
          start_date: DateTime.new(2014,8,23,14,13),
          start_station_name: "Van Ness at Market",
          start_station_id: 66,
          end_date: DateTime.new(2014,8,23,17,17),
          end_station_name: "Van Ness at Market",
          end_station_id: 66,
          bike_id: 400,
          zip_code: 94127,
          subscription_type: "Subscriber")

        Trip.create!(
          duration: 644456,
          start_date: DateTime.new(2014,8,23,14,13),
          start_station_name: "Van Ness at Market",
          start_station_id: 40,
          end_date: DateTime.new(2014,8,23,17,17),
          end_station_name: "Van Ness at Market",
          end_station_id: 40,
          bike_id: 400,
          zip_code: 94127,
          subscription_type: "Subscriber")

        Condition.create!(
          date: Date.new(2014,8,23),
          max_temperature_f: 40,
          min_temperature_f: 30,
          mean_temperature_f: 35,
          mean_humidity: 10,
          mean_visibility_miles: 4 ,
          mean_wind_speed_mph: 1,
          precipitation_inches: 4,
          zip_code: 94127)

        expect(Condition.average_trips_with_max_temperature(30, 50)).to eq(2)
      end
    end
    describe ".highest_trips_with_max_temperature" do
      it "returns highest trips between temperatures" do
        Trip.create!(
          duration: 633456,
          start_date: DateTime.new(2014,8,23,14,13),
          start_station_name: "Van Ness at Market",
          start_station_id: 66,
          end_date: DateTime.new(2014,8,23,17,17),
          end_station_name: "Van Ness at Market",
          end_station_id: 66,
          bike_id: 400,
          zip_code: 94127,
          subscription_type: "Subscriber")

        Trip.create!(
          duration: 644456,
          start_date: DateTime.new(2014,8,23,14,13),
          start_station_name: "Van Ness at Market",
          start_station_id: 40,
          end_date: DateTime.new(2014,8,23,17,17),
          end_station_name: "Van Ness at Market",
          end_station_id: 40,
          bike_id: 400,
          zip_code: 94127,
          subscription_type: "Subscriber")

          Trip.create!(
            duration: 644356,
            start_date: DateTime.new(2014,8,24,14,13),
            start_station_name: "Van Ness at Market",
            start_station_id: 40,
            end_date: DateTime.new(2014,8,23,17,17),
            end_station_name: "Van Ness at Market",
            end_station_id: 40,
            bike_id: 400,
            zip_code: 94127,
            subscription_type: "Customer")

        Condition.create!(
          date: Date.new(2014,8,23),
          max_temperature_f: 40,
          min_temperature_f: 30,
          mean_temperature_f: 35,
          mean_humidity: 10,
          mean_visibility_miles: 4 ,
          mean_wind_speed_mph: 1,
          precipitation_inches: 4,
          zip_code: 94127)

          Condition.create!(
            date: Date.new(2014,8,24),
            max_temperature_f: 40,
            min_temperature_f: 30,
            mean_temperature_f: 35,
            mean_humidity: 10,
            mean_visibility_miles: 4 ,
            mean_wind_speed_mph: 1,
            precipitation_inches: 4,
            zip_code: 94127)

        expect(Condition.highest_trips_with_max_temperature(30, 50)).to eq(2)
      end
    end

    describe ".lowest_trips_with_max_temperature" do
      it "returns lowest trips between temperatures" do
        Trip.create!(
          duration: 633456,
          start_date: DateTime.new(2014,8,23,14,13),
          start_station_name: "Van Ness at Market",
          start_station_id: 66,
          end_date: DateTime.new(2014,8,23,17,17),
          end_station_name: "Van Ness at Market",
          end_station_id: 66,
          bike_id: 400,
          zip_code: 94127,
          subscription_type: "Subscriber")

        Trip.create!(
          duration: 644456,
          start_date: DateTime.new(2014,8,23,14,13),
          start_station_name: "Van Ness at Market",
          start_station_id: 40,
          end_date: DateTime.new(2014,8,23,17,17),
          end_station_name: "Van Ness at Market",
          end_station_id: 40,
          bike_id: 400,
          zip_code: 94127,
          subscription_type: "Subscriber")

          Trip.create!(
            duration: 644356,
            start_date: DateTime.new(2014,8,24,14,13),
            start_station_name: "Van Ness at Market",
            start_station_id: 40,
            end_date: DateTime.new(2014,8,23,17,17),
            end_station_name: "Van Ness at Market",
            end_station_id: 40,
            bike_id: 400,
            zip_code: 94127,
            subscription_type: "Customer")

          Condition.create!(
            date: Date.new(2014,8,23),
            max_temperature_f: 40,
            min_temperature_f: 30,
            mean_temperature_f: 35,
            mean_humidity: 10,
            mean_visibility_miles: 4 ,
            mean_wind_speed_mph: 1,
            precipitation_inches: 4,
            zip_code: 94127)

          Condition.create!(
            date: Date.new(2014,8,24),
            max_temperature_f: 40,
            min_temperature_f: 30,
            mean_temperature_f: 35,
            mean_humidity: 10,
            mean_visibility_miles: 4 ,
            mean_wind_speed_mph: 1,
            precipitation_inches: 4,
            zip_code: 94127)

        expect(Condition.lowest_trips_with_max_temperature(30, 50)).to eq(1)
      end
    end

    describe ".trips_with_wind_speed" do
      it "returns collection of conditions between wind speeds associated with trips" do
        Trip.create!(
          duration: 633456,
          start_date: DateTime.new(2014,8,23,14,13),
          start_station_name: "Van Ness at Market",
          start_station_id: 66,
          end_date: DateTime.new(2014,8,23,17,17),
          end_station_name: "Van Ness at Market",
          end_station_id: 66,
          bike_id: 400,
          zip_code: 94127,
          subscription_type: "Subscriber")

        Trip.create!(
          duration: 644456,
          start_date: DateTime.new(2014,8,23,14,13),
          start_station_name: "Van Ness at Market",
          start_station_id: 40,
          end_date: DateTime.new(2014,8,23,17,17),
          end_station_name: "Van Ness at Market",
          end_station_id: 40,
          bike_id: 400,
          zip_code: 94127,
          subscription_type: "Subscriber")

        Condition.create!(
          date: Date.new(2014,8,23),
          max_temperature_f: 40,
          min_temperature_f: 30,
          mean_temperature_f: 35,
          mean_humidity: 10,
          mean_visibility_miles: 4 ,
          mean_wind_speed_mph: 1,
          precipitation_inches: 4,
          zip_code: 94127)

          expect(Condition.trips_with_wind_speed(0, 4).count).to eq(2)
        end
      end

      describe ".average_trips_with_wind_speed" do
        it "returns average wind speeds in a range" do
          Trip.create!(
            duration: 633456,
            start_date: DateTime.new(2014,8,23,14,13),
            start_station_name: "Van Ness at Market",
            start_station_id: 66,
            end_date: DateTime.new(2014,8,23,17,17),
            end_station_name: "Van Ness at Market",
            end_station_id: 66,
            bike_id: 400,
            zip_code: 94127,
            subscription_type: "Subscriber")

          Trip.create!(
            duration: 633456,
            start_date: DateTime.new(2014,8,23,14,13),
            start_station_name: "Van Ness at Market",
            start_station_id: 66,
            end_date: DateTime.new(2014,8,23,17,17),
            end_station_name: "Van Ness at Market",
            end_station_id: 66,
            bike_id: 400,
            zip_code: 94127,
            subscription_type: "Subscriber")

          Condition.create!(
            date: Date.new(2014,8,23),
            max_temperature_f: 40,
            min_temperature_f: 30,
            mean_temperature_f: 35,
            mean_humidity: 10,
            mean_visibility_miles: 4 ,
            mean_wind_speed_mph: 3,
            precipitation_inches: 4,
            zip_code: 94127)

            expect(Condition.average_trips_with_wind_speed(1, 4)).to eq(2)
          end
        end

      describe ".max_trips_with_wind_speed" do
        it "returns highest wind speed in range" do
          Trip.create!(
            duration: 633456,
            start_date: DateTime.new(2014,8,23,14,13),
            start_station_name: "Van Ness at Market",
            start_station_id: 66,
            end_date: DateTime.new(2014,8,23,17,17),
            end_station_name: "Van Ness at Market",
            end_station_id: 66,
            bike_id: 400,
            zip_code: 94127,
            subscription_type: "Subscriber")

          Trip.create!(
            duration: 633456,
            start_date: DateTime.new(2014,8,23,14,13),
            start_station_name: "Van Ness at Market",
            start_station_id: 66,
            end_date: DateTime.new(2014,8,23,17,17),
            end_station_name: "Van Ness at Market",
            end_station_id: 66,
            bike_id: 400,
            zip_code: 94127,
            subscription_type: "Subscriber")

          Condition.create!(
            date: Date.new(2014,8,23),
            max_temperature_f: 40,
            min_temperature_f: 30,
            mean_temperature_f: 35,
            mean_humidity: 10,
            mean_visibility_miles: 4 ,
            mean_wind_speed_mph: 3,
            precipitation_inches: 4,
            zip_code: 94127)

          expect(Condition.max_trips_with_wind_speed(0, 4)).to eq(2)
        end
      end
      describe ".min_trips_with_wind_speed" do
        it "returns lowest wind speed in range" do
          Trip.create!(
            duration: 633456,
            start_date: DateTime.new(2014,8,23,14,13),
            start_station_name: "Van Ness at Market",
            start_station_id: 66,
            end_date: DateTime.new(2014,8,23,17,17),
            end_station_name: "Van Ness at Market",
            end_station_id: 66,
            bike_id: 400,
            zip_code: 94127,
            subscription_type: "Subscriber")

          Trip.create!(
            duration: 633456,
            start_date: DateTime.new(2014,8,23,14,13),
            start_station_name: "Van Ness at Market",
            start_station_id: 66,
            end_date: DateTime.new(2014,8,23,17,17),
            end_station_name: "Van Ness at Market",
            end_station_id: 66,
            bike_id: 400,
            zip_code: 94127,
            subscription_type: "Subscriber")

          Condition.create!(
            date: Date.new(2014,8,23),
            max_temperature_f: 40,
            min_temperature_f: 30,
            mean_temperature_f: 35,
            mean_humidity: 10,
            mean_visibility_miles: 4 ,
            mean_wind_speed_mph: 3,
            precipitation_inches: 4,
            zip_code: 94127)

          expect(Condition.min_trips_with_wind_speed(0, 4)).to eq(2)
        end
      end

      describe ".trips_with_precipitation" do
        it "returns collection of conditions between wind speeds associated with trips" do
          Trip.create!(
            duration: 633456,
            start_date: DateTime.new(2014,8,23,14,13),
            start_station_name: "Van Ness at Market",
            start_station_id: 66,
            end_date: DateTime.new(2014,8,23,17,17),
            end_station_name: "Van Ness at Market",
            end_station_id: 66,
            bike_id: 400,
            zip_code: 94127,
            subscription_type: "Subscriber")

          Trip.create!(
            duration: 633456,
            start_date: DateTime.new(2014,8,23,14,13),
            start_station_name: "Van Ness at Market",
            start_station_id: 66,
            end_date: DateTime.new(2014,8,23,17,17),
            end_station_name: "Van Ness at Market",
            end_station_id: 66,
            bike_id: 400,
            zip_code: 94127,
            subscription_type: "Subscriber")

          Condition.create!(
            date: Date.new(2014,8,23),
            max_temperature_f: 40,
            min_temperature_f: 30,
            mean_temperature_f: 35,
            mean_humidity: 10,
            mean_visibility_miles: 4 ,
            mean_wind_speed_mph: 3,
            precipitation_inches: 4,
            zip_code: 94127)

          expect(Condition.trips_with_precipitation(0, 4).count).to eq(2)
        end
      end

      describe ".average_trips_with_precipitation" do
        it "returns average precipitation in a range" do
          Trip.create!(
            duration: 633456,
            start_date: DateTime.new(2014,8,23,14,13),
            start_station_name: "Van Ness at Market",
            start_station_id: 66,
            end_date: DateTime.new(2014,8,23,17,17),
            end_station_name: "Van Ness at Market",
            end_station_id: 66,
            bike_id: 400,
            zip_code: 94127,
            subscription_type: "Subscriber")

          Trip.create!(
            duration: 633456,
            start_date: DateTime.new(2014,8,23,14,13),
            start_station_name: "Van Ness at Market",
            start_station_id: 66,
            end_date: DateTime.new(2014,8,23,17,17),
            end_station_name: "Van Ness at Market",
            end_station_id: 66,
            bike_id: 400,
            zip_code: 94127,
            subscription_type: "Subscriber")

          Condition.create!(
            date: Date.new(2014,8,23),
            max_temperature_f: 40,
            min_temperature_f: 30,
            mean_temperature_f: 35,
            mean_humidity: 10,
            mean_visibility_miles: 4 ,
            mean_wind_speed_mph: 3,
            precipitation_inches: 4,
            zip_code: 94127)

            expect(Condition.average_trips_with_precipitation(0, 4)).to eq(2)
          end
        end

      describe ".highest_trips_with_precipitation" do
        it "returns trip with highest precipitation in range" do
          Trip.create!(
            duration: 633456,
            start_date: DateTime.new(2014,8,23,14,13),
            start_station_name: "Van Ness at Market",
            start_station_id: 66,
            end_date: DateTime.new(2014,8,23,17,17),
            end_station_name: "Van Ness at Market",
            end_station_id: 66,
            bike_id: 400,
            zip_code: 94127,
            subscription_type: "Subscriber")

          Trip.create!(
            duration: 633456,
            start_date: DateTime.new(2014,8,23,14,13),
            start_station_name: "Van Ness at Market",
            start_station_id: 66,
            end_date: DateTime.new(2014,8,23,17,17),
            end_station_name: "Van Ness at Market",
            end_station_id: 66,
            bike_id: 400,
            zip_code: 94127,
            subscription_type: "Subscriber")

          Condition.create!(
            date: Date.new(2014,8,23),
            max_temperature_f: 40,
            min_temperature_f: 30,
            mean_temperature_f: 35,
            mean_humidity: 10,
            mean_visibility_miles: 4 ,
            mean_wind_speed_mph: 3,
            precipitation_inches: 4,
            zip_code: 94127)

          expect(Condition.highest_trips_with_precipitation(0, 4)).to eq(2)
        end
      end
      describe ".lowest_trips_with_precipitation" do
        it "returns lowest precipiation in range" do
          Trip.create!(
            duration: 633456,
            start_date: DateTime.new(2014,8,23,14,13),
            start_station_name: "Van Ness at Market",
            start_station_id: 66,
            end_date: DateTime.new(2014,8,23,17,17),
            end_station_name: "Van Ness at Market",
            end_station_id: 66,
            bike_id: 400,
            zip_code: 94127,
            subscription_type: "Subscriber")

          Trip.create!(
            duration: 633456,
            start_date: DateTime.new(2014,8,23,14,13),
            start_station_name: "Van Ness at Market",
            start_station_id: 66,
            end_date: DateTime.new(2014,8,23,17,17),
            end_station_name: "Van Ness at Market",
            end_station_id: 66,
            bike_id: 401,
            zip_code: 94927,
            subscription_type: "Subscriber")

          Condition.create!(
            date: Date.new(2014,8,23),
            max_temperature_f: 40,
            min_temperature_f: 30,
            mean_temperature_f: 35,
            mean_humidity: 10,
            mean_visibility_miles: 4 ,
            mean_wind_speed_mph: 3,
            precipitation_inches: 3,
            zip_code: 94127)

          expect(Condition.lowest_trips_with_precipitation(0, 4)).to eq(2)
        end
      end
  end
end
