require_relative "../../spec_helper"

RSpec.describe "When a user deletes a condition" do
  it "the condition no longer exists" do
    conditions_for_date1 = Condition.create(date: "14/3/2017", max_temp: 30.0, min_temp: 20.0, mean_temp: 26.0, mean_humidity: 30.0, mean_visibility: 3.0, mean_wind_speed: 12.0, precipitation: 0.03)
    conditions_for_date2 = Condition.create(date: "20/3/2016", max_temp: 20.0, min_temp: 40.0, mean_temp: 30.0, mean_humidity: 10.0, mean_visibility: 1.0, mean_wind_speed: 15.0, precipitation: 0.03)

    visit '/conditions/2'

    click_on 'Delete conditions for this day'
    expect(current_path).to eq '/conditions'

    expect(Condition.all.count).to eq 1
    expect(Condition.where(id: 2)).to_not exist
    expect(page).to_not have_content(conditions_for_date2.date)
    expect(page).to have_content(conditions_for_date1.max_temp)
  end
end
