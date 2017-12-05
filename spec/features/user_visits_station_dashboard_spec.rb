require 'spec_helper'

describe "when a visitor visits the trips-dashboard" do
  it "sees trips analytics" do
        date = DateTime.new(5-14-2010)
        Station.create!( name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
        Station.create!( name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")

    visit '/station-dashboard'

    expect(page).to have_content("Station Dashboard")
  end
end


  # it "clicks the edit link and is presented an edit form" do
  #   Station.create(name: "The station", dock_count: 33, city: "San Francisco", installation_date: "04-03-1204")
  #   visit '/stations'
  #   click_link('Edit')
  #
  #   expect(page).to have_content("Edit your station")
  # end
  #
  # it "clicks the delete button which deletes station and redirects to index" do
  #   Station.create(name: "The station", dock_count: 33, city: "San Francisco", installation_date: "04-03-1204")
  #   visit '/stations'
  #   click_on('delete')
  #
  #   expect(page).to have_content("Bike Station Details")
  #   expect(Station.count).to eq(0)
  # end

# end
