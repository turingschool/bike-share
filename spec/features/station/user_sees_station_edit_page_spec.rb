require 'spec_helper'

describe "when user visits /stations/:id/edit path" do 
  before(:each) do 
    Station.create(name: "San Jose Civic Center", dock_count: 15, city: "San Jose", installation_date: "2013-08-06")
    Station.create(name: "Timo", dock_count: 10, city: "San Jose", installation_date: "2014-04-09")
    Station.create(name: "Lee", dock_count: 5, city: "SD", installation_date: "2015-06-09")
    
    visit '/stations/1/edit'
  end

  it "sees and Edit Station page with appropriate header" do

    expect(page).to have_content("Edit Station")
  end

  it "sees links in header bar" do

  expect(page).to have_link("Stations", :href=>'/stations')
  expect(page).to have_link("Trips", :href=>'/trips')
  expect(page).to have_link("Station Dashboard", :href=>'/stations-dashboard')
  expect(page).to have_link("Trip Dashboard", :href=>'/trips-dashboard')
  expect(page).to have_link("Home", :href=>'/')
  
  end

  it "has all the appropriate content to edit" do

    expect(page).to have_content("Station Name:")
    expect(page).to have_content("Number of Docks:")
    expect(page).to have_content("City:")
    expect(page).to have_content("Installation Date:")    
  end
end