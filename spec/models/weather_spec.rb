describe "Weather" do
  describe "Validations" do
    it "is valid with all information" do
      weather = Weather.new(date_id: 1,
                                max_temperature: 45.0,
                                mean_temperature: 30.0,
                                min_temperature: 21.0,
                                mean_humidity: 29.0,
                                mean_visibility: 33.0,
                                mean_wind_speed: 65.0,
                                precipitation: 55.0,
                                zip_code_id: 1 )

      expect(weather).to be_valid
    end

    it "is invalid without a date" do
      weather = Weather.new( max_temperature: 45.0,
                                mean_temperature: 30.0,
                                min_temperature: 21.0,
                                mean_humidity: 29.0,
                                mean_visibility: 33.0,
                                mean_wind_speed: 65.0,
                                precipitation: 55.0,
                                zip_code_id: 1 )

      expect(weather).to_not be_valid
    end

    it "is invalid without max_temperature" do
      weather = Weather.new(date_id: 1,
                                mean_temperature: 30.0,
                                min_temperature: 21.0,
                                mean_humidity: 29.0,
                                mean_visibility: 33.0,
                                mean_wind_speed: 65.0,
                                precipitation: 55.0,
                                zip_code_id: 1 )

      expect(weather).to_not be_valid
    end

    it "is invalid without mean_temperature" do
      weather = Weather.new(date_id: 1,
                                max_temperature: 45.0,
                                min_temperature: 21.0,
                                mean_humidity: 29.0,
                                mean_visibility: 33.0,
                                mean_wind_speed: 65.0,
                                precipitation: 55.0,
                                zip_code_id: 1 )

      expect(weather).to_not be_valid
    end

    it "is invalid without mean_humidity" do
      weather = Weather.new(date_id: 1,
                                max_temperature: 45.0,
                                mean_temperature: 30.0,
                                min_temperature: 21.0,
                                mean_visibility: 33.0,
                                mean_wind_speed: 65.0,
                                precipitation: 55.0,
                                zip_code_id: 1 )

      expect(weather).to_not be_valid
    end

    it "is invalid without mean_visibility" do
      weather = Weather.new(date_id: 1,
                                max_temperature: 45.0,
                                mean_temperature: 30.0,
                                min_temperature: 21.0,
                                mean_humidity: 29.0,
                                mean_wind_speed: 65.0,
                                precipitation: 55.0,
                                zip_code_id: 1 )

      expect(weather).to_not be_valid
    end

    it "is invalid without mean_wind_speed" do
      weather = Weather.new(date_id: 1,
                                max_temperature: 45.0,
                                mean_temperature: 30.0,
                                min_temperature: 21.0,
                                mean_humidity: 29.0,
                                mean_visibility: 33.0,
                                precipitation: 55.0,
                                zip_code_id: 1 )

      expect(weather).to_not be_valid
    end

    it "is invalid without precipitation" do
      weather = Weather.new(date_id: 1,
                                max_temperature: 45.0,
                                mean_temperature: 30.0,
                                min_temperature: 21.0,
                                mean_humidity: 29.0,
                                mean_visibility: 33.0,
                                mean_wind_speed: 65.0,
                                zip_code_id: 1 )

      expect(weather).to_not be_valid
    end

    it "is invalid without zip_code" do
      weather = Weather.new(date_id: 1,
                                max_temperature: 45.0,
                                mean_temperature: 30.0,
                                min_temperature: 21.0,
                                mean_humidity: 29.0,
                                mean_visibility: 33.0,
                                mean_wind_speed: 65.0,
                                precipitation: 55.0 )

      expect(weather).to_not be_valid
    end
  end
end
