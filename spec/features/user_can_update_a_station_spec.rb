require 'spec_helper'

describe "When a user makes changes to a stations information" do
  it "saves this new info to the database" do 
    station_1 = Station.create!(id: 2,name: "The station", dock_count: 33, city: "San Francisco", installation_date: "04-03-1204")
  

    visit '/stations/2/edit'
    expect(find_field('station[name]').value).to eq 'The station'
    expect(find_field('station[dock_count]').value).to eq "33"
    expect(find_field('station[installation_date]').value).to eq "04-03-1204"

    fill_in 'station[name]', with: "Paddington"
    fill_in 'station[dock_count]', with: 44
    fill_in 'station[installation_date]', with: "04-03-1204"

    page.find("#btn_submit").click

    expect(page).to have_current_path "/stations"
    expect(page).to have_content "Paddington"


   
  end 
end 