require_relative '../spec_helper'
require 'pry'

RSpec.describe "As a user visits station dashboard" do

  before(:each) do
    Station.create(name:'San Jose Diridon Caltrain Station', city: "San Jose", dock_count: 27, installation_date: "8/1/2013")
    Station.create(name: "Denver Station", city: "Denver", dock_count: 25, installation_date: "8/6/2012")
    Station.create(name: "Test Station", city: "Denver", dock_count: 55, installation_date: "8/6/2015")
    Station.create(name: "Golden Station", city: "Denver", dock_count: 35, installation_date: "8/9/2016")
  end

  it "they can see content" do
      visit '/station-dashboard'

      within('h2') do
        expect(page).to have_content('Dashboard')
      end

      within("body") do
          expect(page).to have_content('Total Count: 4')
      end

      within("body") do
          expect(page).to have_content('Average Bikes Available per Station: 35')
      end

      within("body") do
          expect(page).to have_content('Stations With Most Bikes: Test Station: 55')
      end

      within("body") do
          expect(page).to have_content('Stations With Most Bikes:')

      end

      within(".most_bikes li:nth-child(1)") do
        expect(page).to have_content('Test Station: 55')
      end

      within(".most_bikes li:nth-child(2)") do
        expect(page).to have_content('Golden Station: 35')
      end

      within(".most_bikes li:nth-child(3)") do
        expect(page).to have_content('San Jose Diridon Caltrain Station: 27')
      end

      within("body") do
          expect(page).to have_content('Station With Fewest Bikes: Denver Station (25)')
      end

      within("body") do
          expect(page).to have_content('Stations With Fewest Bikes:')
      end

      within(".fewest_bikes li:nth-child(1)") do
        expect(page).to have_content('Denver Station: 25')
      end

      within(".fewest_bikes li:nth-child(2)") do
        expect(page).to have_content('San Jose Diridon Caltrain Station: 27')
      end

      within(".fewest_bikes li:nth-child(3)") do
        expect(page).to have_content('Golden Station: 35')
      end
#------------------------------------------------------------------------------
      within("body") do
          expect(page).to have_content('Most Recently Installed Station: Golden Station')
      end

      within("body") do
          expect(page).to have_content('Oldest Station: Denver Station')
      end


  end
end
