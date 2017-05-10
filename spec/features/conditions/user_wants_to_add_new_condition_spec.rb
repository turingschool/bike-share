require './spec/spec_helper'

RSpec.describe "user wants to add condition" do

  it "adds a condition" do
    visit('/conditions/new')

      fill_in "condition[date]", with: '2017-03-13'
      fill_in "condition[zip_code]", with: 80206
      fill_in "condition[maximum_temperature]", with: 99
      fill_in "condition[mean_temperature]", with: 57
      fill_in "condition[minimum_temperature]", with: 20
      fill_in "condition[mean_humidity]", with: 205
      fill_in "condition[mean_visibility]", with: 69
      fill_in "condition[mean_wind_speed]", with: 102
      fill_in "condition[percipitation]", with: 9.56
      fill_in "city", with: 'Denver'

      click_button "Submit"
      condition = Condition.last

      expect(current_path).to eq("/conditions/#{condition.id}")

      expect(page).to have_content("Denver")
      expect(page).to have_content("2017-03-13")
      expect(page).to have_content("80206")
      expect(page).to have_content("99")
      expect(page).to have_content("57")
      expect(page).to have_content("20")
      expect(page).to have_content("205")
      expect(page).to have_content("69")
      expect(page).to have_content("102")
      expect(page).to have_content("9.56")
  end

  it "and adds without a name" do
    visit('/conditions/new')

      fill_in "condition[date]", with: '2017-03-13'
      fill_in "condition[zip_code]", with: 80206
      fill_in "condition[maximum_temperature]", with: 99
      fill_in "condition[mean_temperature]", with: 57
      fill_in "condition[minimum_temperature]", with: 20
      fill_in "condition[mean_humidity]", with: 205
      fill_in "condition[mean_wind_speed]", with: 102
      fill_in "condition[percipitation]", with: 9.56
      fill_in "city", with: 'Denver'
      click_button "Submit"
    
      condition = Station.last

      expect(current_path).to eq("/conditions/new")

      expect(page).to have_field("condition[date]", with: "2017-03-13 00:00:00 UTC")
      expect(page).to have_field('city', with: "Denver")
      expect(page).to have_field("condition[zip_code]", with: "80206")
      expect(page).to have_field("condition[maximum_temperature]", with: "99")
      expect(page).to have_field("condition[mean_temperature]", with: "57")
      expect(page).to have_field("condition[minimum_temperature]", with: "20")
      expect(page).to have_field("condition[mean_humidity]", with: "205")
      expect(page).to have_field("condition[mean_visibility]", with: "can't be blank")
      expect(page).to have_field("condition[mean_wind_speed]", with: "102")
      expect(page).to have_field("condition[percipitation]", with: "9.56")
  end

end
