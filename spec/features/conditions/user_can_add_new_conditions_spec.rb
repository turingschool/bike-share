require './app/models/condition'

RSpec.describe "User creates condition" do
  it "with valid attributes" do

    visit '/conditions/new'

    fill_in("date", with: "2013-08-29")
    fill_in("max_temperature_f", with: 10.0)
    fill_in("mean_temperature_f", with: 5.0)
    fill_in("min_temperature_f", with: 0.0)
    fill_in("max_humidity", with: 100.0)
    fill_in("mean_humidity", with: 0.0)
    fill_in("mean_visibility_miles", with: 8.0)
    fill_in("mean_wind_speed_mph", with: 40.0)
    fill_in("precipitation_inches", with: 20.0)
    click_on("Submit")


    expect(page).to have_content("2013-08-29")
    expect(page).to have_content(10.0)
    expect(page).to have_content(5.0)
    expect(page).to have_content(0.0)
    expect(page).to have_content(100.0)
    expect(page).to have_content(0.0)
    expect(page).to have_content(8.0)
    expect(page).to have_content(40.0)
    expect(page).to have_content(20.0)
  end
end
