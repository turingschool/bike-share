require './spec/spec_helper'

RSpec.describe WeatherStatistic do
  describe "validations" do
    it "can make a valid weather info" do
      date = DateRef.new(date: 2012-01-01)
      weather = WeatherStatistic.new(max_temperature: 1, mean_temperature: 1, min_temperature: 1, mean_humidity: 1, mean_visibility: 1, mean_wind_speed:1, precipitation:1, date_ref_id: 1)

      expect(weather).to be_valid
    end

    it "is valid without a max_temperature" do
      weather = WeatherStatistic.new(mean_temperature: 1, min_temperature: 1, mean_humidity: 1, mean_visibility: 1, mean_wind_speed:1, precipitation:1, date_ref_id: 1)

      expect(weather).to_not be_valid
    end

    it "is valid without a mean_temperature" do
      weather = WeatherStatistic.new(max_temperature: 1, min_temperature: 1, mean_humidity: 1, mean_visibility: 1, mean_wind_speed:1, precipitation:1, date_ref_id: 1)

      expect(weather).to_not be_valid
    end

    it "is valid without a min_temperature" do
      weather = WeatherStatistic.new(max_temperature: 1, mean_temperature: 1, mean_humidity: 1, mean_visibility: 1, mean_wind_speed:1, precipitation:1, date_ref_id: 1)

      expect(weather).to_not be_valid
    end

    it "is valid without a mean humidity" do
      weather = WeatherStatistic.new(max_temperature: 1, min_temperature:1, mean_temperature: 1, mean_visibility: 1, mean_wind_speed:1, precipitation:1, date_ref_id: 1)

      expect(weather).to_not be_valid
    end

    it "is valid without a mean visibility" do
      weather = WeatherStatistic.new(max_temperature: 1, min_temperature:1, mean_temperature: 1, mean_humidity: 1, mean_wind_speed:1, precipitation:1, date_ref_id: 1)

      expect(weather).to_not be_valid
    end

    it "is valid without a mean wind speed" do
      weather = WeatherStatistic.new(max_temperature: 1, min_temperature:1, mean_temperature: 1, mean_humidity: 1, mean_visibility: 1, precipitation:1, date_ref_id: 1)

      expect(weather).to_not be_valid
    end

    it "is valid without a precipitation" do
      weather = WeatherStatistic.new(max_temperature: 1, min_temperature:1, mean_temperature: 1, mean_humidity: 1, mean_visibility: 1, mean_wind_speed:1, date_ref_id: 1)

      expect(weather).to_not be_valid
    end

    it "is valid without a date" do
      weather = WeatherStatistic.new(max_temperature: 1, mean_temperature: 1, min_temperature: 1, mean_humidity: 1, mean_visibility: 1, mean_wind_speed:1, precipitation:1)

      expect(weather).to_not be_valid
    end


  end
end
