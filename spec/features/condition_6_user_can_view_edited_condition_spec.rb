require_relative '../spec_helper'

RSpec.describe "user can fill in form" do
  it "it updates page with correct information" do

      visit('/conditions/1/edit')

      fill_in "condition[max_temperature]", with: "70"
      fill_in "condition[min_temperature]", with: "50"
      fill_in "condition[mean_humidity]", with: "20"
      fill_in "condition[mean_wind_speed]", with: "22"
      click_button "Submit changes"
      
      expect(current_path).to eq('/conditions/1')
      expect(page).to have_content("22mph")
      expect(page).to have_content("70")
  end
end
