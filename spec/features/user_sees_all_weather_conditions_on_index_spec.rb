RSpec.describe "user visits weather_conditions index" do
  before do
    BikeShareDate.create(date: Date.strptime('1/1/2012', '%m/%d/%Y'))
    BikeShareDate.create(date: Date.strptime('2/5/2017', '%m/%d/%Y'))
    BikeShareDate.create(date: Date.strptime('4/12/2014', '%m/%d/%Y'))
    BikeShareDate.create(date: Date.strptime('6/25/2017', '%m/%d/%Y'))
    BikeShareDate.create(date: Date.strptime('2/1/2012', '%m/%d/%Y'))

    @weather_1 = WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation: 0.11, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 1, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 2, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 4, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 5, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 2, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 5, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 1, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    @weather_35 = WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity:51.0, precipitation:0.54, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
  end

  it "and they see the first 30 weather_conditions" do
    visit('/weather_conditions')

    expect(page).to have_content(@weather_1.precipitation)

    expect(page).to_not have_content(@weather_35.precipitation)
  end
end
