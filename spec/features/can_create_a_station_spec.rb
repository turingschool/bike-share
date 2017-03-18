require_relative "../spec_helper"

RSpec.describe "Creating a station" do
  it "Can enter station attributes" do

    visit "/stations/new"
    fill_in "station[name]", with: "SuperStation"
    fill_in "station[dock_count]", with: "15"
    fill_in "station[city]", with: "Denver"
    fill_in "station[installation_date]", with: 20150203

    click_on "Create Station"

    expect(current_path).to eq("/stations")

    expect(page).to have_content("SuperStation")
    expect(page).to have_content("Dock Count: 15")
    expect(page).to have_content("City: Denver")
    expect(page).to have_content("Installation Date: 2015-02-03")
  end

  it "Can edit a stations attributes" do
    Station.create(name:"Navy Pier", dock_count:"12", city:"Chicago", installation_date: "20170101")
    visit "/stations/1/edit"

    fill_in "station[name]", with: "Main Street"
    fill_in "station[dock_count]", with:"12"
    fill_in "station[city]", with:"Chicago"
    fill_in "station[installation_date]", with: "20170101"

    click_on "Submit"

    expect(current_path).to eq("/stations/1")

    expect(page).to have_content("Main Street")
  end

  it "Can delete stations from list" do
    Station.create(name:"Navy Pier", dock_count:"12", city:"Chicago", installation_date: "20170101")
    visit '/stations'

    expect(page).to have_content("Navy Pier")

    click_on "Delete"

    expect(page).to_not have_content("Navy Pier")
  end
end
