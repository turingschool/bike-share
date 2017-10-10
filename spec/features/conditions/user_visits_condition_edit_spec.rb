require './spec/spec_helper'

feature 'When a user visits condition edit page' do
  context 'for a condition that exists'
    background do
      Condition.create! date: "8/29/2013",
                        max_temperature_f: "74.0",
                        mean_temperature_f: "68.0",
                        min_temperature_f: "61.0",
                        mean_humidity: "75.0",
                        mean_visibility_miles: "10.0",
                        mean_wind_speed: "11.0",
                        precipitation_inches: "0"
      visit '/conditions/2/edit'
    end

    it 'has a form' do
      expect(page).to have_css('form')
    end

    it 'they see a date field' do
      expect(page).to have_field('condition[date]')
    end

    it 'they see a maximum temperature field' do
      expect(page).to have_content(/temperature maximum/i)
      expect(page).to have_field('condition[max_temperature_f]')
    end

    it 'they see a mean temperature field' do
      expect(page).to have_content(/temperature mean/i)
      expect(page).to have_field('condition[mean_temperature_f]')
    end

    it 'they see a mininum temperature field' do
      expect(page).to have_content(/temperature mininum/i)
      expect(page).to have_field('condition[min_temperature_f]')
    end

    it 'they see a mean humidity field' do
      expect(page).to have_content(/mean humidity/i)
      expect(page).to have_field('condition[mean_humidity]')
    end

    it 'they see a mean visibility miles field' do
      expect(page).to have_content(/mean visibility/i)
      expect(page).to have_field('condition[mean_visibility_miles]')
    end

    it 'they see a mean wind speed field' do
      expect(page).to have_content(/mean wind speed/i)
      expect(page).to have_field('condition[mean_wind_speed]')
    end

    it 'they see a precipitation field' do
      expect(page).to have_content(/precipitation/i)
      expect(page).to have_field('condition[precipitation_inches]')
    end

end
