describe Weather do
  it "can find max trips" do
    context "max rides by max_temperature" do
      set = Weather.find_all_with_max_temp_in_range(70, 80)
      day = Weather.max_rides(:max_temperature, set)

      expect(day).to_eq(...)
    end

    context "max rides by precipitation" do
      set = Weather.find_all_with_precipitation_in_range(0.0, 3.5)
      day = Weather.max_rides(:precipitation, set)

      expect(day).to_eq(...)
    end

    context "max rides by wind speed" do
      set = Weather.find_all_with_wind_speed_in_range(0.0, 20.0)
      day = Weather.max_rides(:wind_speed)

      expect(day).to_eq(...)
    end

    context "max rides by visibility" do
      set = Weather.find_all_with_visibility_in_range(5.0, 13.0)
      day = Weather.max_rides(:visibility)

      expect(day).to_eq(...)
    end
  end
end
