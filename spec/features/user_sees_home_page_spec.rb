require_relative "../spec_helper"

RSpec.describe "When a user visits '/' " do
  it "they see a welcome message" do
    visit '/'
    within('h1') do
      expect(page).to have_content('Welcome to Bike Share!!!')
    end
    within('a') do
      expect(page).to have_content("All Bike Stations")
    end
  end
end
