require 'spec_helper'

describe "when user visits root path" do
  it "sees Welcome to Bike Share and two links for
      stations and trips" do
      
    visit '/'

    expect(page).to have_content("Welcome to Bike Share")
    expect(page).to have_link("Stations", :href=>"/stations")
    expect(page).to have_link("Trips", :href=>"/trips")
  end
end
