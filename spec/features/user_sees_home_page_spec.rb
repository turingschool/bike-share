require_relative "../spec_helper"

RSpec.describe "When a user visits '/' " do
  it "they see lowrider bike share" do
    #as a user
    #when I visit '/'
    visit "/"
    # I expect to see "Welcome to Bike Share!" in an h2
    within("h2") do
      expect(page).to have_content("Lowrider Bike Share")
    end
    #and i expect to see a link to "Stations"
      expect(page).to have_link("Stations", :href => "/stations")
      expect(page).to have_link("Trips", :href => "/trips")
      expect(page).to have_link("Conditions", :href => "/conditions")
  end
end
