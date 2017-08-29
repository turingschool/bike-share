describe "Weather Dashboard" do
  before(:each) { visit("/weather_dashboard") }
  it "shows highest/lowest number of rides" do

    expect(page).to have_css("p", count => 2)
  end

  it "shows rides by max temperature" do

    expect(page).to have_css(".average_temperature", count => 6)
    expect(page).to have_css(".max_temperature", count => 6)
    expect(page).to have_css(".fewest_temperature", count => 6)
  end

  it "shows rides by precipitation" do

    expect(page).to have_css(".average_precipitation", count => 7)
    expect(page).to have_css(".max_precipitation", count => 7)
    expect(page).to have_css(".fewest_precipitation", count => 7)
  end

  it "shows rides by wind speed" do

    expect(page).to have_css(".average_wind_speed", count => 5)
    expect(page).to have_css(".max_wind_speed", count => 5)
    expect(page).to have_css(".fewest_wind_speed", count => 5)
  end

  it "shows rides by visibility" do

    expect(page).to have_css(".average_visibility", count => 2)
    expect(page).to have_css(".max_visibility", count => 2)
    expect(page).to have_css(".fewest_visibility", count => 2)
  end
end
