RSpec.describe "user can see one condition" do
  it "has attributes and delete button" do
    
    visit '/conditions'

    expect(page).to have_content("date")
    expect(page).to have_content("max_temperature_f")
    expect(page).to have_content("mean_temperature_f")
    expect(page).to have_content("min_temperature_f")
    expect(page).to have_content("max_dew_point_f")
    expect(page).to have_content("mean_dew_point_f")
    expect(page).to have_content("min_dew_point_f")
    expect(page).to have_content("max_humidity")
    expect(page).to have_content("mean_humidity")
    expect(page).to have_content("min_humidity")
    expect(page).to have_content("max_sea_level_pressure_inches")
    expect(page).to have_content("mean_sea_level_pressure_inches")
    expect(page).to have_content("min_sea_level_pressure_inches")
    expect(page).to have_content("max_visibility_miles")
    expect(page).to have_content("mean_visibility_miles")
    expect(page).to have_content("min_visibility_miles")
    expect(page).to have_content("max_wind_speed_mph")
    expect(page).to have_content("mean_wind_speed_mph")
    expect(page).to have_content("max_gust_speed_mph")
    expect(page).to have_content("precipitation_inches")
    expect(page).to have_content("cloud_cover")
    expect(page).to have_content("events")
    expect(page).to have_content("wind_dir_degrees")
    expect(page).to have_content("zip_code")
  end
end
