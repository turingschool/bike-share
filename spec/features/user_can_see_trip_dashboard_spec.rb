require_relative '../spec_helper'
require 'pry'

RSpec.describe "As a user visits trip dashboard" do

  before(:each) do
    Trip.create(duration: 60, start_date: "2013/8/20 14:21", start_station_name: "South Van Ness at Market", end_date: "2013/08/21", end_station_name: "New York Station", bike_id: 520, subscription_type_id: 1, zip_code: 94127)
    Trip.create(duration: 61, start_date: "2013/8/22", start_station_name: "Denver Station", end_date: "2013/08/23", end_station_name: "Washington Station", bike_id: 521, subscription_type_id: 1, zip_code: 94127)
    Trip.create(duration: 62, start_date: "2013/8/22", start_station_name: "Denver Station", end_date: "2013/08/25", end_station_name: "New York Station", bike_id: 521, subscription_type_id: 2, zip_code: 94127)
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
          expect(page).to have_content('Station with the most rides as a starting place: Denver Station')
      end

      within("body") do
          expect(page).to have_content('Station with the most rides as an ending place: New York Station')
      end

      within("body") do
          expect(page).to have_content('Month by Month breakdown of number of rides with subtotals for each year: ')
      end


      within("body") do
          expect(page).to have_content('Most ridden bike with total number of rides for that bike: 521')
      end

      within("body") do
          expect(page).to have_content('Least ridden bike with total number of rides for that bike: 520')
      end

      within("body") do
          expect(page).to have_content('User subscription type')
      end
      #------------List---------------
      within(".user_subscription li:nth-child(1)") do
        expect(page).to have_content('Subscriber Count: 2 Percentage: 60%')
      end

      within(".user_subsription li:nth-child(2)") do
        expect(page).to have_content('Customer Count: 2 Percentage: 60%')
      end
      #-----------List End------------
      within("body") do
          expect(page).to have_content('Single date with the highest number of trips with a count of those trips: 2')
      end

      within("body") do
          expect(page).to have_content('Single date with the lowest number of trips with a count of those trips: 1')
      end
    end
end