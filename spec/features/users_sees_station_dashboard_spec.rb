require_relative "../spec_helper"

RSpec.describe "When a user visits '/station-dashboard' " do
  it "they see a dashboard message" do
    visit '/station-dashboard'

    within('h1') do
      expect(page).to have_content('Welcome to the Station Dashboard!')
    end

    within('div.total_stations') do
      expect(page).to have_content("Total count of stations:")
    end

    within('div.average_bikes') do
      expect(page).to have_content("Average bikes available per station:")
    end

    within('div.most_bikes') do
      expect(page).to have_content("Most bikes available at a station:")
    end

    within('div.stations_with_most_bikes') do
      expect(page).to have_content("Station(s) where the most bikes are available:")
    end

    within('div.fewest_bikes') do
      expect(page).to have_content("Fewest bikes available at a station:")
    end

    within('div.stations_with_fewest_bikes') do
      expect(page).to have_content("Station(s) where the fewest bikes are available:")
    end

    within('div.newest_stations') do
      expect(page).to have_content("Most recently installed station:")
    end

    within('div.oldest_stations') do
      expect(page).to have_content("Oldest station:")
    end
  end
end
