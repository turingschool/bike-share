RSpec.describe Weather do
  describe "Validations" do
    it "is invalid without a date" do
      weather = Weather.new(max_temperature: 74.0, mean_temperature: 68.0, min_temperature: 61.0, mean_humidity: 75.0, mean_visibility: 10.0, mean_wind_speed: 11.0, precipitation: 1.0)

      expect(weather).to_not be_valid
    end

    it "is invalid without max_temperature" do
      weather = Weather.new(date: "12/03/1991", mean_temperature: 68.0, min_temperature: 61.0, mean_humidity: 75.0, mean_visibility: 10.0, mean_wind_speed: 11.0, precipitation: 1.0)

      expect(weather).to_not be_valid
    end

    it "is invalid without min_temperature" do
      weather = Weather.new(date: "12/03/1991", mean_temperature: 68.0, max_temperature: 61.0, mean_humidity: 75.0, mean_visibility: 10.0, mean_wind_speed: 11.0, precipitation: 1.0)

      expect(weather).to_not be_valid
    end

    it "is invalid without mean_temperature" do
      weather = Weather.new(date: "12/03/1991", max_temperature: 68.0, min_temperature: 61.0, mean_humidity: 75.0, mean_visibility: 10.0, mean_wind_speed: 11.0, precipitation: 1.0)

      expect(weather).to_not be_valid
    end

    it "is invalid without mean_humidity" do
      weather = Weather.new(date: "12/03/1991", mean_temperature: 68.0, min_temperature: 61.0, max_temperature: 75.0, mean_visibility: 10.0, mean_wind_speed: 11.0, precipitation: 1.0)

      expect(weather).to_not be_valid
    end

    it "is invalid without max_temperature" do
      weather = Weather.new(date: "12/03/1991", mean_temperature: 68.0, min_temperature: 61.0, mean_humidity: 75.0, max_temperature: 10.0, mean_wind_speed: 11.0, precipitation: 1.0)

      expect(weather).to_not be_valid
    end

    it "is invalid without mean_wind_speed" do
      weather = Weather.new(date: "12/03/1991", mean_temperature: 68.0, min_temperature: 61.0, mean_humidity: 75.0, mean_visibility: 10.0, max_temperature: 11.0, precipitation: 1.0)

      expect(weather).to_not be_valid
    end

    it "is invalid without max_temperature" do
      weather = Weather.new(date: "12/03/1991", mean_temperature: 68.0, min_temperature: 61.0, mean_humidity: 75.0, mean_visibility: 10.0, mean_wind_speed: 11.0, max_temperature: 1.0)

      expect(weather).to_not be_valid
    end
  end

end
