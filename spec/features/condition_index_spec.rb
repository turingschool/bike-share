require_relative '../spec_helper'

RSpec.describe "when a user visits /conditions" do
  it "they see all conditions" do
    Condition.create(date: "29/8/2013", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)
    visit '/conditions'

    within("h1.title") do
      expect(page).to have_content("Conditions")
    end

    #come back to me
      expect(page).to have_content("2013-08-29")
      expect(page).to have_content("75.0")
      expect(page).to have_content("61.0")
      expect(page).to have_content("0.0")
  end

  it "they can edit a condtion" do
    Condition.create(date: "8/29/2013", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)
     visit "/conditions"

      within("#edit-button button") do
        click_on "Edit"
      end
      expect(current_path).to eq("/conditions/1/edit")
  end

  it "they can delete conditions" do
    Condition.create(date: "8/29/2013", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)
    visit '/conditions'

    within("table") do
      click_on "Delete"
    end
    expect(current_path).to eq("/conditions")

    expect(page).not_to have_content("8/29/2013")
  end
end
