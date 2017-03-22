require_relative "../../spec_helper"

RSpec.describe "When a user visits '/conditions' " do
  it "they see all the conditions" do
    condition1 = Condition.create(date: "14/3/2017", max_temp: 30.0, min_temp: 20.0, mean_temp: 26.0, mean_humidity: 30.0, mean_visibility: 3.0, mean_wind_speed: 12.0, precipitation: 0.03)
    condition2 = Condition.create(date: "12/2/2016", max_temp: 60.0, min_temp: 10.0, mean_temp: 40.0, mean_humidity: 20.0, mean_visibility: 1.0, mean_wind_speed: 1.2, precipitation: 0.00)

    visit '/conditions'

    within('h1') do
      expect(page).to have_content('All Weather Conditions Per Day')
    end
    expect(page).to have_content(condition1.date.strftime("%B %d, %Y"))
    expect(page).to have_content(condition2.date.strftime("%B %d, %Y"))
    expect(page).to have_content(condition1.max_temp)
    expect(page).to have_content(condition2.max_temp)
    expect(page).to have_content(condition1.min_temp)
    expect(page).to have_content(condition2.min_temp)
    expect(page).to have_content(condition1.mean_temp)
    expect(page).to have_content(condition2.mean_temp)
    expect(page).to have_content(condition1.mean_humidity)
    expect(page).to have_content(condition2.mean_humidity)
    expect(page).to have_content(condition1.mean_visibility)
    expect(page).to have_content(condition2.mean_visibility)
    expect(page).to have_content(condition1.mean_wind_speed)
    expect(page).to have_content(condition2.mean_wind_speed)
    expect(page).to have_content(condition1.precipitation)
    expect(page).to have_content(condition2.precipitation)
  end
end
