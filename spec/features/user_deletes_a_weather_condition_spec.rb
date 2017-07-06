RSpec.describe "user deletes a weather condition" do
  it "and sees that it is gone" do
    BikeShareDate.create(date: Date.strptime('2/5/2017', '%m/%d/%Y'))
    BikeShareDate.create(date: Date.strptime('4/12/2014', '%m/%d/%Y'))

    expected = WeatherCondition.create!(date_id: 2, max_temp_f: 78.0, mean_visibility: 40.0, mean_humidity: 81.0, precipitation: 0.58, mean_temp_f: 68.0, mean_wind_speed: 21.0, min_temp_f: 52.0)
    not_deleted = WeatherCondition.create!(date_id: 1, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity: 51.0, precipitation: 0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 1, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity: 51.0, precipitation: 0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)
    WeatherCondition.create!(date_id: 1, max_temp_f: 75.0, mean_visibility: 10.0, mean_humidity: 51.0, precipitation: 0.23, mean_temp_f: 62.0, mean_wind_speed: 22.0, min_temp_f: 59.0)

    visit('/weather_conditions')

    expect(page).to have_content(expected.date.date)
    expect(page).to have_content(expected.date.date)
    expect(page).to have_content(expected.max_temp_f)
    expect(page).to have_content(expected.mean_temp_f)
    expect(page).to have_content(expected.min_temp_f)
    expect(page).to have_content(expected.mean_humidity)
    expect(page).to have_content(expected.mean_visibility)
    expect(page).to have_content(expected.mean_wind_speed)
    expect(page).to have_content(expected.precipitation)

    click_button("delete", :match=> :first)

    expect(page).to_not have_content(expected.date.date)
    expect(page).to_not have_content(expected.date.date)
    expect(page).to_not have_content(expected.max_temp_f)
    expect(page).to_not have_content(expected.mean_temp_f)
    expect(page).to_not have_content(expected.min_temp_f)
    expect(page).to_not have_content(expected.mean_humidity)
    expect(page).to_not have_content(expected.mean_visibility)
    expect(page).to_not have_content(expected.mean_wind_speed)
    expect(page).to_not have_content(expected.precipitation)

    expect(page).to have_content(not_deleted.date.date)
    expect(page).to have_content(not_deleted.date.date)
    expect(page).to have_content(not_deleted.max_temp_f)
    expect(page).to have_content(not_deleted.mean_temp_f)
    expect(page).to have_content(not_deleted.min_temp_f)
    expect(page).to have_content(not_deleted.mean_humidity)
    expect(page).to have_content(not_deleted.mean_visibility)
    expect(page).to have_content(not_deleted.mean_wind_speed)
    expect(page).to have_content(not_deleted.precipitation)
  end
end
