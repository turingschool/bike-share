require_relative '../spec_helper'
require 'pry'

RSpec.describe "A user can view trip" do
  it "and has all content" do
    Trip.create(duration: 63, start_date: 8/28/2013, start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: 8/29/2913, end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520,subscription_type: "Subscriber",zip_code: 94127)
    visit '/trips/1'
    expect(page.all('li')[0].text).to eq("City: San Jose")
    expect(page.all('li')[1].text).to eq("Dock Count: 27")
    expect(page.all('li')[2].text).to eq("Installation Date: 2013-06-08")
    expect(page.all('li')[2].text).to eq("Installation Date: 2013-06-08")
    expect(page.all('li')[2].text).to eq("Installation Date: 2013-06-08")
    expect(page.all('li')[2].text).to eq("Installation Date: 2013-06-08")
    expect(page.all('li')[2].text).to eq("Installation Date: 2013-06-08")
    expect(page.all('li')[2].text).to eq("Installation Date: 2013-06-08")
    expect(page.all('li')[2].text).to eq("Installation Date: 2013-06-08")
    expect(page.all('li')[2].text).to eq("Installation Date: 2013-06-08")
  end
end
