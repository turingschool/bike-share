require 'spec_helper'

describe "station a visitor, when I visit '/stations/new'" do
  before :each do
    visit '/stations/new'
  end

  it "I expect to see a form to create a new station" do
    expect(page.status_code).to eq(200)

    fill_in 'station[name]', :with => "SF"
    fill_in 'station[dock_count]', :with => 5
    fill_in 'station[city]', :with => "San Francisco"
    fill_in 'station[installation_date]', :with => "2013-08-14"
  end
end
