describe Weather do
  it "can find minimum trips" do
    context "minimum rides by max_temperature" do
      set = Weather.find_all_with_max_temp_in_range(70, 80)
      day = Weather.minimum_rides(:max_temperature)

      expect(day).to_eq(...)
    end

    context "minimum rides by precipitation" do
      set = Weather.find_all_with_precipitation_in_range(0.0, 3.5)
      day = Weather.minimum_rides(:precipitation)

      expect(day).to_eq(...)
    end

    context "minimum rides by wind speed" do
      set = Weather.find_all_with_wind_speed_in_range(0.0, 20.0)
      day = Weather.minimum_rides(:wind_speed)

      expect(day).to_eq(...)
    end

    context "minimum rides by visibility" do
      set = Weather.find_all_with_visibility_in_range(5.0, 13.0)
      day = Weather.minimum_rides(:visibility)

      expect(day).to_eq(...)
    end
  end
end
