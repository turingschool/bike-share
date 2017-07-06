RSpec.describe "user visits individual show page for WeatherCondition" do
  it "and sees information about that trip" do
    BikeShareDate.create(date: Date.strptime('1/1/2012', '%m/%d/%Y'))
    BikeShareDate.create(date: Date.strptime('2/5/2017', '%m/%d/%Y'))
    BikeShareDate.create(date: Date.strptime('4/12/2014', '%m/%d/%Y'))

    WeatherCondition.create!(date_id: 3, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity: 51.0, precipitation: 0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 1, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity: 51.0, precipitation: 0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    expected = WeatherCondition.create!(date_id: 3, max_temp_f: 78.0, mean_visibility: 5.0, mean_humidity: 22.0, precipitation: 0.58, mean_temp_f: 68.0, mean_wind_speed: 21.0, min_temp_f: 52.0)

    visit('/weather_conditions/3')

    expect(page).to have_content(expected.date.date)
    expect(page).to have_content(expected.max_temp_f)
    expect(page).to have_content(expected.mean_temp_f)
    expect(page).to have_content(expected.min_temp_f)
    expect(page).to have_content(expected.mean_humidity)
    expect(page).to have_content(expected.mean_visibility)
    expect(page).to have_content(expected.mean_wind_speed)
    expect(page).to have_content(expected.precipitation)
  end
end
