require_relative '../spec_helper'

RSpec.describe "A user sees a form" do
  before(:each) { Condition.create(date: "8/7/2015", max_temp: 88, min_temp: 55, mean_temp: 70, mean_humidity: 3, mean_visibility: 4, mean_wind_speed: 1, precipitation:0)}


  it "that has name, city, dock count, and installation date" do
    visit '/conditions/1/edit'
    fill_in "condition[date]", with: "8/8/2013"
    fill_in "condition[max_temp]", with: 75
    fill_in "condition[min_temp]", with: 88
    fill_in "condition[mean_temp]", with: 80
    fill_in "condition[mean_humidity]", with: 4
    fill_in "condition[mean_visibility]", with: 2
    fill_in "condition[mean_wind_speed]", with: 5
    fill_in "condition[precipitation]", with: 33
    click_on "Update Condition"

      expect(current_path).to eq("/conditions/page/1")
      expect(page).to have_content("2013-08-08")
      expect(page).to have_content("75")
      expect(page).to have_content("88")
      expect(page).to have_content("80")
      expect(page).to have_content("4")
      expect(page).to have_content("2")
      expect(page).to have_content("5")
      expect(page).to have_content("33")
  end
end
