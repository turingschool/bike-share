RSpec.describe WeatherCondition do
  describe "Validations" do
    it "is invalid without a date_id" do
      weather = WeatherCondition.new(max_temp_f: 11.0, mean_temp_f: 12.5, min_temp_f: 13.6, mean_humidity: 45.2, mean_visibility: 3.5, mean_wind_speed: 3.8, precipitation: 2.1)

      expect(weather).to_not be_valid
    end

    it "is invalid without a max_temp_f" do
      weather = WeatherCondition.new(date_id: 1, mean_temp_f: 12.5, min_temp_f: 13.6, mean_humidity: 45.2, mean_visibility: 3.5, mean_wind_speed: 3.8, precipitation: 2.1)

      expect(weather).to_not be_valid
    end

    it "is invalid without mean_temp_f" do
      weather = WeatherCondition.new(date_id: 1, max_temp_f: 11.0, min_temp_f: 13.6, mean_humidity: 45.2, mean_visibility: 3.5, mean_wind_speed: 3.8, precipitation: 2.1)

      expect(weather).to_not be_valid
    end

    it "is invalid without min_temp_f" do
      weather = WeatherCondition.new(date_id: 1, max_temp_f: 11.0, mean_temp_f: 12.5, mean_humidity: 45.2, mean_visibility: 3.5, mean_wind_speed: 3.8, precipitation: 2.1)

      expect(weather).to_not be_valid
    end

    it "is invalid without mean_humidity" do
      weather = WeatherCondition.new(date_id: 1, max_temp_f: 11.0, mean_temp_f: 12.5, min_temp_f: 13.6, mean_visibility: 3.5, mean_wind_speed: 3.8, precipitation: 2.1)

      expect(weather).to_not be_valid
    end

    it "is invalid without mean_visibility" do
      weather = WeatherCondition.new(date_id: 1, max_temp_f: 11.0, mean_temp_f: 12.5, min_temp_f: 13.6, mean_humidity: 45.2, mean_wind_speed: 3.8, precipitation: 2.1)

      expect(weather).to_not be_valid
    end

    it "is invalid without mean_wind_speed" do
      weather = WeatherCondition.new(date_id: 1, max_temp_f: 11.0, mean_temp_f: 12.5, min_temp_f: 13.6, mean_humidity: 45.2, mean_visibility: 3.5, precipitation: 2.1)

      expect(weather).to_not be_valid
    end

    it "is invalid without precipitation" do
      weather = WeatherCondition.new(date_id: 1, max_temp_f: 11.0, mean_temp_f: 12.5, min_temp_f: 13.6, mean_humidity: 45.2, mean_visibility: 3.5, mean_wind_speed: 3.8)

      expect(weather).to_not be_valid
    end
  end
end
