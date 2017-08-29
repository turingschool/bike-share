describe Weather do
  it "can increment max temperature" do
    increment_list = Weather.find_max_temp_increment

    expect(increment_list.count).to_eq(6)
  end

  it "can increment precipitation" do
    increment_list = Weather.find_precipitation_increment

    expect(increment_list.count).to_eq(7)
  end

  it "can increment wind speed" do
    increment_list = Weather.find_wind_speed_increment

    expect(increment_list.count).to_eq(5)
  end

  it "can increment visibility" do
    increment_list = Weather.find_visibility_increment

    expect(increment_list.count).to_eq(2)
  end
end
