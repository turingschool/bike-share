require './spec/spec_helper'

RSpec.describe "when a user edits a station" do
  before do
    Station.create(
                  name: "something",
                  dock_count: 1,
                  city_id: 1,
                  installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'),
                  longitude: -121.9,
                  latitude: 30.7
    )
    visit('/stations/1/edit')
  end

  it "displays form with current information" do
    expect(page).to have_content("Edit station")
  end
  # has a form
  # form has current information in it
  # can save changes to station
end
