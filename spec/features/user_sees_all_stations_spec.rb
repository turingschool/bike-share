require_relative "../spec_helper"
require 'pry'


RSpec.describe "User sees all content" do
  it "and has one of the stations and all header names" do
      station = Station.create(name: "Denver Station", city: "Denver", dock_count: 25, installation_date: "8/6/2013")
      visit "/stations"
      expect(page).to have_content("Name")
      expect(page).to have_content("Dock Count")
      expect(page).to have_content("City")
      expect(page).to have_content("Installation Date")
      expect(page).to have_content("Denver Station")
      expect(page).to have_content("25")
      expect(page).to have_content("Denver")
      expect(page).to have_content("2013-06-08")
  end

  it "and has a create new station button that links to correct route" do
    visit "/stations"
    page.click_link('', :href => '/stations/new')
    # expected_path = "/stations/new"
    expect(current_path).to eq("/stations/new")
    # expect(page).to have_current_path(expected_path)
  end

  it "they can click on a station name and be redirected to that station" do
    Station.create(name: "Denver Station", city: "Denver", dock_count: 25, installation_date: "8/6/2013")
    visit '/stations'
      click_on('Denver Station')
      expect(current_path).to eq("/stations/1")
  end
end
