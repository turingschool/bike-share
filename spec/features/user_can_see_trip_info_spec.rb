require_relative '../spec_helper'
require 'pry'

RSpec.describe "A user can view trip" do
  it "and has all content" do
    Trip.create(duration: 63, start_date: 8/28/2013, start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: 8/29/2913, end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520,subscription_type: "Subscriber",zip_code: 94127)
    visit '/trips/1'
    expect(page.all('li')[0].text).to eq("Duration: 63")
    expect(page.all('li')[1].text).to eq("Start Date: 8/28/2013")
    expect(page.all('li')[2].text).to eq("Start Station Name: South Van Ness at Market")
    expect(page.all('li')[3].text).to eq("Start Station ID: 66")
    expect(page.all('li')[4].text).to eq("End Date: 8/29/2013")
    expect(page.all('li')[5].text).to eq("End Station Name: South Van Ness at Market")
    expect(page.all('li')[6].text).to eq("End Station ID: 66")
    expect(page.all('li')[7].text).to eq("Bike ID: 520")
    expect(page.all('li')[8].text).to eq("Subscription Type: Subscriber")
    expect(page.all('li')[9].text).to eq("Zip Code: 94127")
  end
end
