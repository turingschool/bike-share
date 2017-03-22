require_relative "../spec_helper"

RSpec.describe "When a user visits '/' " do
  it "they see a welcome message" do
    visit '/'

    within('h1') do
      expect(page).to have_content('Welcome to Bike Share!')
    end

    within('a.dropdown-toggle.stations') do
      expect(page).to have_content("Bike Stations")
    end

    within('a.dropdown-toggle.trips') do
      expect(page).to have_content("Trips")
    end

    within('a.dropdown-toggle.conditions') do
      expect(page).to have_content("Weather Conditions")
    end

  end
end
