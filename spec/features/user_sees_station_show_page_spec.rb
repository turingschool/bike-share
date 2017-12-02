require 'spec_helper'

describe "as a user when I visit station show page" do
  before :each do

    @station = Station.create(name: "SF", dock_count: 5,
    city: "San Francisco", installation_date: "2013-08-23")

    visit "/stations/#{@station.id}"
  end

  it "I see station show details" do
    expect(page.status_code).to eq(200)

    expect(page).to have_content("SF")
    expect(page).to have_content(5)
    expect(page).to have_content("San Francisco")
    expect(page).to have_content("2013-08-23")
  end

  it "I can edit the details" do
    click_link("Edit")

    expect(current_path).to eq("/stations/#{@station.id}/edit")
  end

  it "I can delete station and redirect to station index" do
    click_button("Delete")

    expect(current_path).to eq("/stations/index")
  end
end
