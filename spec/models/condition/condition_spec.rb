RSpec.describe Condition do
  context "Validations" do
    it "is invalid without date" do
      condition = Condition.create(
                               max_temperature_f: 85,
                               mean_temperature_f: 80,
                               min_temperature_f: 75,
                               mean_humidity: 75,
                               mean_visibility_miles: 3,
                               mean_wind_speed_mph: 15,
                               precipitation_inches: 0.5)
      expect(condition).to be_invalid
    end

    it "is invalid without max temperature" do
      condition = Condition.create(date: '2013-08-30',
                               mean_temperature_f: 80,
                               min_temperature_f: 75,
                               mean_humidity: 75,
                               mean_visibility_miles: 3,
                               mean_wind_speed_mph: 15,
                               precipitation_inches: 0.5)

      expect(condition).to be_invalid
    end

    it "is invalid without mean temperature" do
      condition = Condition.create(date: '2013-08-30',
                               max_temperature_f: 85,
                               min_temperature_f: 75,
                               mean_humidity: 75,
                               mean_visibility_miles: 3,
                               mean_wind_speed_mph: 15,
                               precipitation_inches: 0.5)

      expect(condition).to be_invalid
    end

    it "is invalid without mean temperature" do
      condition = Condition.create(date: '2013-08-30',
                               max_temperature_f: 85,
                               mean_temperature_f: 80,
                               mean_humidity: 75,
                               mean_visibility_miles: 3,
                               mean_wind_speed_mph: 15,
                               precipitation_inches: 0.5)

      expect(condition).to be_invalid
    end

    it "is invalid without min temperature" do
      condition = Condition.create(date: '2013-08-30',
                               max_temperature_f: 85,
                               mean_temperature_f: 80,
                               mean_humidity: 75,
                               mean_visibility_miles: 3,
                               mean_wind_speed_mph: 15,
                               precipitation_inches: 0.5)

      expect(condition).to be_invalid
    end

    it "is invalid without mean humidity" do
      condition = Condition.create(date: '2013-08-30',
                               max_temperature_f: 85,
                               mean_temperature_f: 80,
                               mean_visibility_miles: 3,
                               mean_wind_speed_mph: 15,
                               precipitation_inches: 0.5)

      expect(condition).to be_invalid
    end

    it "is invalid without mean visibility" do
      condition = Condition.create(date: '2013-08-30',
                               max_temperature_f: 85,
                               mean_temperature_f: 80,
                               mean_humidity: 75,
                               mean_wind_speed_mph: 15,
                               precipitation_inches: 0.5)

      expect(condition).to be_invalid
    end

    it "is invalid without mean wind speed" do
      condition = Condition.create(date: '2013-08-30',
                               max_temperature_f: 85,
                               mean_temperature_f: 80,
                               mean_humidity: 75,
                               precipitation_inches: 0.5)

      expect(condition).to be_invalid
    end

    it "is invalid without precipitation" do
      condition = Condition.create(date: '2013-08-30',
                               max_temperature_f: 85,
                               mean_temperature_f: 80,
                               mean_humidity: 75,
                               mean_wind_speed_mph: 15)

      expect(condition).to be_invalid
    end
  end

  context "Class Methods", :foo => true do
    describe '.days_within_high_temp' do
      it "returns days within temp range" do
        # require "pry"; binding.pry
        expect(Condition.days_within_high_temp(81).count).to eq(34)
      end
    end

    describe '.days_within_precipitation' do
      it "returns days within a precipitation range" do

        expect(Condition.days_within_precipitation(1).count).to eq(3)
      end
    end

    describe '.days_within_wind' do
      it "returns days within a wind range mph" do
        expect(Condition.days_within_wind(7).count).to eq(367)
      end
    end

    describe '.days_within_visibility' do
      it "returns days within amount of miles" do
        expect(Condition.days_within_visibility(1).count).to eq(10)
      end
    end

    describe '.rides_per_day_desc' do
      it "groups all rides by weather type" do
        expect(Condition.days_within_high_temp(81).rides_per_day_desc.first[1]).to eq(12)
      end
    end

    describe '.min_rides_temp' do
      it "returns lowest number of rides in temp range" do
        expect(Condition.min_rides_temp(81)).to eq(12)
      end
    end

    describe '.average_rides_temp' do
      it "returns average number of rides in temp range" do
        expect(Condition.average_rides_temp(81)).to eq(12)
      end
    end

    describe '.max_rides_temp' do
      it "returns highest number of rides in temp range" do
        expect(Condition.max_rides_temp(81)).to eq(12)

      end
    end

    describe '.min_rides_precip' do
      it "returns lowest number of rides in precip range" do
        expect(Condition.min_rides_precip(0)).to eq(9)
      end
    end

    describe '.average_rides_precip' do
      it "returns average number of rides in precip range" do
        expect(Condition.average_rides_precip(0)).to eq(19)
      end
    end

    describe '.max_rides_precip' do
      it "returns highest number of rides in precip range" do
        expect(Condition.max_rides_precip(0)).to eq(36)
      end
    end

    describe '.min_rides_wind' do
      it "returns lowest number of rides in wind range" do
        expect(Condition.min_rides_wind(7)).to eq(9)
      end
    end

    describe '.average_rides_wind' do
      it "returns average number of rides in wind range" do
        expect(Condition.average_rides_wind(7)).to eq(16)
      end
    end

    describe '.max_rides_wind' do
      it "returns highest number of rides in wind range" do
        expect(Condition.max_rides_wind(7)).to eq(32)
      end
    end

    describe '.min_rides_visibility' do
      it "returns lowest number of rides in visibility range" do
        expect(Condition.min_rides_visibility(9)).to eq(9)
      end
    end

    describe '.average_rides_visibility' do
      it "returns average number of rides in visibility range" do
        expect(Condition.average_rides_visibility(9)).to eq(19)
      end
    end

    describe '.max_rides_visibility' do
      it "returns highest number of rides in visibility range" do
        expect(Condition.average_rides_visibility(9)).to eq(19)
      end
    end

    describe '.all_rides_within_wind_speed' do
      it "returns hash with date and ride numbers" do
      end
    end

    describe '.all_rides_within_visibility_range' do
      it "returns hash with date and rider numbers" do
      end
    end

    describe '.all_rides_within_temp_range' do
      it "returns hash with date and rider numbers" do
      end
    end

    describe '.weather_on_day_with_highest_rides' do
      it "returns conditions on days with highest rides" do
      end
    end

    describe '.weather_on_day_with_lowest_rides' do
      it "returns conditions on days with highest rides" do
      end
    end

  end
end
