require_relative "../spec_helper"

RSpec.describe "When a user visits '/' " do
  it "they see a welcome message" do
    #as a user
    #when I visit '/'
    visit "/"
    # I expect to see "Welcome to Bike Share!" in an h2
    within("h2.title") do
      expect(page).to have_content("Welcome to Bike Share!")
    end
    #and i expect to see a link to "Stations"
    within("a") do
      expect(page).to have_content("Stations")
    end
  end
end
