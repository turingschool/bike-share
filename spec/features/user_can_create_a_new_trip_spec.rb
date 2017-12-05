require 'spec_helper'

describe "When a user visits /trips/new" do
  it "they can create a new trip" do
    visit "/trips/new"

    fill_in "trip[duration]", with: "77"
    fill_in "trip[start_date]", with: "2013-08-29"
    fill_in "trip[start_station_name]", with: "Golden Gate at Polk"
    fill_in "trip[end_date]", with: "2013-08-29"
    fill_in "trip[end_station_name]", with: "Adobe on Almaden"
    fill_in "trip[bike_id]", with: "679"
    fill_in "trip[subscription_type]", with: "Subscriber"
    fill_in "trip[zip_code]", with: "95112"
    
    page.find("#btn_submit").click

  
    
    expect(current_path).to eq("/trips")
    
   
   
  end
end