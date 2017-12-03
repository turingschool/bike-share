require 'spec_helper'

describe 'As a visitor' do
  describe 'when I go to "/conditions/:id/edit" ' do
    before :each do
      @condition = Condition.create(date: "2013-08-07", max_temperature_f: 80,
      mean_temperature_f: 70, min_temperature_f: 60)

      visit "/conditions/#{@condition.id}/edit"
    end

    it "should give me a form with several form fields to edit with
    the option to submit which will redirect me to conditions index" do
      fill_in "condition[date]", with: "2013-08-07"
      fill_in "condition[max_temperature_f]", with: 80
      fill_in "condition[mean_temperature_f]", with: 70
      fill_in "condition[min_temperature_f]", with: 60
      fill_in 'condition[mean_humidity]', :with => 20
      fill_in 'condition[mean_visibility_miles]', :with => 30
      fill_in 'condition[mean_wind_speed_mph]', :with => 20
      fill_in 'condition[precipitation_inches]', :with => 4
      fill_in 'condition[zip_code]', :with => 93019

      click_button("Submit")

      expect(current_path).to eq("/conditions/#{@condition.id}")
    end
  end
end
