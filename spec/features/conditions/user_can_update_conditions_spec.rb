require 'spec_helper'

describe 'As a visitor' do
  describe 'when I go to "/conditions/:id/edit" ' do
    before :each do
      @condition_1 = Condition.create!(id: "2014-08-20", date: "2014-08-20", max_temperature_f: 70,
      mean_temperature_f: 60, min_temperature_f: 50, mean_humidity: 20,
      mean_visibility_miles: 50, mean_wind_speed_mph: 12, precipitation_inches: 4,
      zip_code: 94127)

      visit "/conditions/#{@condition_1.id}/edit"
    end

    it "should give me a form with several form fields to edit with
    the option to submit which will redirect me to conditions index" do
    # require 'pry'; binding.pry
      fill_in "condition[max_temperature_f]", with: 80
      fill_in "condition[mean_temperature_f]", with: 70
      fill_in "condition[min_temperature_f]", with: 60
      fill_in 'condition[mean_humidity]', :with => 20
      fill_in 'condition[mean_visibility_miles]', :with => 30
      fill_in 'condition[mean_wind_speed_mph]', :with => 20
      fill_in 'condition[precipitation_inches]', :with => 4
      fill_in 'condition[zip_code]', :with => 93019

      click_button("Submit")

      expect(current_path).to eq("/conditions/2014-08-20")
    end
  end
end
