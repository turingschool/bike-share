describe Weather do
  it "can find weather with highest rides" do
    day = Weather.highest_rides_weather

    expect(day).to_eq(...)
  end

  it "can find weather with lowest rides" do
    day = Weather.lowest_rides_weather

    expect(day).to_eq(...)
  end
end
