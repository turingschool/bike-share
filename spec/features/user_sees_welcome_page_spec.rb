require 'spec_helper'

describe "when user visits root path" do
  it "sees Welcome to Bike Share" do
    visit '/'

    expect(page).to have_content("Welcome to Bike Share")
    expect(page).to have_link("See Stations", :href=>"/stations")
    expect(page).to have_link("See Trips", :href=>"/trips")
  end
end
