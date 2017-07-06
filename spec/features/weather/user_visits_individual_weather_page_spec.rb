RSpec.describe "User visits individual weather day" do

  it "sees individual weather day" do
    @weather_date = BikeDate.create(date: "2017-04-19")
    @weather_day = Condition.create(date_id: @weather_date.id, max_temp: 85.0, mean_temp: 83.0, min_temp: 81.0, mean_humidity: 77.0, mean_visibility: 7.0, mean_wind_speed: 12.0, precipitation: 1.0)

    visit '/conditions/#{@weather_day.id}'

    expect(current_path).to eq "/weather/#{@weather_day.id}"
    expect(page).to have_content("April 19, 2017")
    expect(page).to have_content("Max Temp")
    expect(page).to have_content("Min Temp")
    expect(page).to have_content("Mean Temp")
    expect(page).to have_content("Mean Humidity")
    expect(page).to have_content("Mean Visibility")
    expect(page).to have_content("Mean Wind Speed")
    expect(page).to have_content("Mean Precipitation")
  end
end
