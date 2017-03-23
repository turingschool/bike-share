require_relative '../spec_helper'

RSpec.describe "when a user visits /conditions/1" do
  it "they see the condition's info" do
    Condition.create(date: "29/8/2013", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)
    visit '/conditions/1'


      expect(page).to have_content("Conditions For: 2013-08-29")


      expect(page).to have_content("Maximum Temperature: 75.0")
      expect(page).to have_content("Mean Temperature: 68.0")
      expect(page).to have_content("Minimum Temperature: 61.0")
      expect(page).to have_content("Mean Humidity: 70.0")
      expect(page).to have_content("Mean Visibility (in miles): 10.0")
      expect(page).to have_content("Mean Wind Speed (mph): 11.0")
      expect(page).to have_content("Precipitation (inches): 0.0")

  end

  it "they can delete that condition" do
    Condition.create(date: "29/8/2013", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)

    visit '/conditions/1'

    click_on "Delete"

    expect(current_path).to eq("/conditions")

    within("table") do
      expect(page).not_to have_content("75.0")
    end
  end

  it "they can edit that condition" do
    Condition.create(date: "29/8/2013", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)

    visit '/conditions/1'

    within "#edit-button" do
      click_on "Edit"
    end

    expect(current_path).to eq("/conditions/1/edit")
  end
end
