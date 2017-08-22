RSpec.describe Condition do
  describe "Validations" do
    it "is valid with all information" do
      condition = Condition.new(date: "2013-08-29", max_temperature_f: 74.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)

      expect(condition).to be_valid
    end

    it "is invalid without a date" do
      condition = Condition.new(max_temperature_f: 74.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)

      expect(condition).to_not be_valid
    end

    it "is invalid without a max_temperature_f" do
      condition = Condition.new(date: "2013-08-29", mean_temperature_f: 68.0, min_temperature_f: 61.0, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)

      expect(condition).to_not be_valid
    end
    it "is invalid without a mean_temperature_f" do
      condition = Condition.new(date: "2013-08-29", max_temperature_f: 74.0, min_temperature_f: 61.0, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)

      expect(condition).to_not be_valid
    end
    it "is invalid without a min_temperature_f" do
      condition = Condition.new(date: "2013-08-29", max_temperature_f: 74.0, mean_temperature_f: 68.0, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)

      expect(condition).to_not be_valid
    end
    it "is invalid without a mean_humidity" do
      condition = Condition.new(date: "2013-08-29", max_temperature_f: 74.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)

      expect(condition).to_not be_valid
    end
    it "is invalid without a mean_visibility_miles" do
      condition = Condition.new(date: "2013-08-29", max_temperature_f: 74.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, mean_humidity: 75.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0)

      expect(condition).to_not be_valid
    end
    it "is invalid without a mean_wind_speed_mph" do
      condition = Condition.new(date: "2013-08-29", max_temperature_f: 74.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, mean_humidity: 75.0, mean_visibility_miles: 10.0, precipitation_inches: 0.0)

      expect(condition).to_not be_valid
    end
    it "is invalid without a precipitation_inches" do
      condition = Condition.new(date: "2013-08-29", max_temperature_f: 74.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0)

      expect(condition).to_not be_valid
    end
  end
end
