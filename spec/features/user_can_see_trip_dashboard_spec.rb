require_relative '../spec_helper'
require 'pry'

RSpec.describe "As a user visits trip dashboard" do

  before(:each) do
    Trip.create(duration: 60, start_date: "2013/8/20 14:21", start_station_name: "South Van Ness at Market", end_date: "2013/08/21", end_station_name: "New York Station", bike_id: 520, subscription_type_id: 1, zip_code: 94127)
    Trip.create(duration: 61, start_date: "2013/8/22", start_station_name: "Denver Statation", end_date: "2013/08/23", end_station_name: "Washington Station", bike_id: 521, subscription_type_id: 1, zip_code: 94127)
    Trip.create(duration: 62, start_date: "2013/8/24", start_station_name: "Denver Station", end_date: "2013/08/25", end_station_name: "New York Station", bike_id: 522, subscription_type_id: 2, zip_code: 94127)
  end

  it "they can see content" do
      visit '/trips-dashboard'
      within('h2') do   
        expect(page).to have_content('Dashboard')
      end

      within("body") do
          expect(page).to have_content('Average duration of a ride: 61')
      end

      within("body") do
          expect(page).to have_content('Longest ride: 62')
      end

      within("body") do
          expect(page).to have_content('Shortest ride: 60')
      end

      within("body") do
          expect(page).to have_content('Station with the most rides as a starting place: Denver Statiton')
      end

      within("body") do
          expect(page).to have_content('Station with the most rides as an ending place: New York Station')
      end

      # within("body") do
      #     expect(page).to have_content('Month by Month breakdown of number of rides with subtotals for each year:')
      # end

      # within("body") do
      #     expect(page).to have_content('Most ridden bike with total number of rides for that bike:')
      # end

      # within("body") do
      #     expect(page).to have_content('Least ridden bike with total number of rides for that bike:')
      # end

      # within("body") do
      #     expect(page).to have_content('User subscription type breakout with both count and percentage:')
      # end

      # within("body") do
      #     expect(page).to have_content('Single date with the highest number of trips with a count of those trips:')
      # end

      # within("body") do
      #     expect(page).to have_content('Single date with the lowest number of trips with a count of those trips:')
      # end
      













      # within(".most_bikes li:nth-child(1)") do
      #   expect(page).to have_content('Test Station: 55')
      # end

      # within(".most_bikes li:nth-child(2)") do
      #   expect(page).to have_content('Golden Station: 35')
      # end

#       within(".most_bikes li:nth-child(3)") do
#         expect(page).to have_content('San Jose Diridon Caltrain Station: 27')
#       end

#       within("body") do
#           expect(page).to have_content('Station With Fewest Bikes: Denver Station (25)')
#       end

#       within("body") do
#           expect(page).to have_content('Stations With Fewest Bikes:')
#       end

#       within(".fewest_bikes li:nth-child(1)") do
#         expect(page).to have_content('Denver Station: 25')
#       end

#       within(".fewest_bikes li:nth-child(2)") do
#         expect(page).to have_content('San Jose Diridon Caltrain Station: 27')
#       end

#       within(".fewest_bikes li:nth-child(3)") do
#         expect(page).to have_content('Golden Station: 35')
#       end
# #------------------------------------------------------------------------------
#       within("body") do
#           expect(page).to have_content('Most Recently Installed Station: Golden Station')
#       end

#       within("body") do
#           expect(page).to have_content('Oldest Station: Denver Station')
#       end


#   end
# end
