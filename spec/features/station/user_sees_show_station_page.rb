require 'spec_helper'

describe "when user visits /stations/:id path" do 
  before(:each) do 
    Station.create(name: "San Jose Civic Center", dock_count: 15, city: "San Jose", installation_date: "2013-08-06")
    Station.create(name: "Timo", dock_count: 10, city: "San Jose", installation_date: "2014-04-09")
    Station.create(name: "Lee", dock_count: 5, city: "SD", installation_date: "2015-06-09")
    Trip.create(duration: 35,
      start_date: DateTime.now,
      start_station_name: "Japan",
      start_station_id: 1,
      end_date: DateTime.now,
      end_station_name: "Narita",
      end_station_id: 1,
      bike_id: 105,
      subscription_type: "Subscriber")

    visit '/stations/1'
  end

  it "has a link back to station index" do 
     
    expect(page).to have_link "Station Index", :href=>'/stations'
  end

  it "has appropriate header" do

    expect(page).to have_content "San Jose Civic Center"
  end

  it "has appropriate titles for data" do

    expect(page).to have_content "City:"
    expect(page).to have_content "Dock Count:"
    expect(page).to have_content "Installation Date"
    expect(page).to have_content "Number of starting rides:"
    expect(page).to have_content "Number of ending rides:"
    expect(page).to have_content "Most frequent destination station:"
    expect(page).to have_content "Most frequent bike ID starting here:"
  end

  it "has appropriate date loaded" do 

    expect(page).to have_content 15
    expect(page).to have_content "2013-08-06"
    expect(page).to have_content "San Jose"
    expect(page).to have_content "Number of ending rides: 1"
    expect(page).to have_content "Number of starting rides: 1"    
    
  end

end