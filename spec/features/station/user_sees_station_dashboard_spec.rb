require 'spec_helper'

describe "when user visits /stations-dasboard path" do 
  before(:each) do 
    Station.create(name: "San Jose Civic Center", dock_count: 15, city: "San Jose", installation_date: "2013-08-06")
    Station.create(name: "Timo", dock_count: 10, city: "San Jose", installation_date: "2014-04-09")
    Station.create(name: "Lee", dock_count: 5, city: "SD", installation_date: "2015-06-09")
    
    visit '/stations-dashboard'
  end

  it "sees page with appropriate header" do

    expect(page).to have_content "Station Dashboard"
  end

  it "sees appropriate links" do

    expect(page).to have_link "Stations", :href=>'/stations'
    expect(page).to have_link "Trips", :href=>'/trips'
    expect(page).to have_link "Trip Dashboard", :href=>'/trips-dashboard'
    expect(page).to have_link "Home", :href=>'/'
  end

  it "sees page with appropriate titles for data" do

    expect(page).to have_content "Total Station Count:"
    expect(page).to have_content "Average Bike Docks Per Station:"
    expect(page).to have_content "Most Bikes At A Station:"
    expect(page).to have_content "Newest Station(s):"
    expect(page).to have_content "Oldest Station(s):"
    expect(page).to have_content "Station(s) With Most Bikes:"
  end

  it "sees appropriate data generated" do
  
    expect(page).to have_content 3
    expect(page).to have_content "San Jose Civic Center"
    expect(page).to have_content "Lee"
  end
end