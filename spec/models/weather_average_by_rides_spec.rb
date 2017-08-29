describe Weather do
  it "can find average trips" do
    context "average rides by max_temperature" do
      set = Weather.find_all_with_max_temp_in_range(70, 80)
      day = Weather.average_rides(:max_temperature, set)

      expect(day).to_eq(...)
    end

    context "average rides by precipitation" do
      set = Weather.find_all_with_precipitation_in_range(0.0, 3.5)
      day = Weather.average_rides(:precipitation, set)

      expect(day).to_eq(...)
    end

    context "average rides by wind speed" do
      set = Weather.find_all_with_wind_speed_in_range(0.0, 20.0)
      day = Weather.average_rides(:wind_speed, set)

      expect(day).to_eq(...)
    end

    context "average rides by visibility" do
      set = Weather.find_all_with_visibility_in_range(5.0, 13.0)
      day = Weather.average_rides(:visibility, set)

      expect(day).to_eq(...)
    end
  end
end
